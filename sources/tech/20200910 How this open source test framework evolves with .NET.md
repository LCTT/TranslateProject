[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How this open source test framework evolves with .NET)
[#]: via: (https://opensource.com/article/20/9/testing-net-fixie)
[#]: author: (Patrick Lioi https://opensource.com/users/patricklioi)

How this open source test framework evolves with .NET
======
Re-evaluating and overhauling a software project's design are crucial
steps to keep up as circumstances change.
![magnifying glass on computer screen, finding a bug in the code][1]

A software project's design is a consequence of the time it was written. As circumstances change, it's wise to take a step back and consider whether old ideas still make for a good design. If not, you risk missing out on enhancements, simplifications, new degrees of freedom, or even a project's very survival.

This is relevant advice for [.NET][2] developers whose dependencies are subject to constant updates or are preparing for .NET 5. The [Fixie][3] project confronted this reality as we flexed to outside circumstances during the early adoption phase of .NET Core. Fixie is an open source .NET test framework similar to NUnit and xUnit with an emphasis on [developer ergonomics][4] and customization. It was developed before .NET Core and has gone through a few major design overhauls in response to platform updates.

### The problem: Reliable assembly loading

A .NET test project tends to feel a lot like a library: a bunch of classes with no visible entry point. The assumption is that a test runner, like Fixie's Visual Studio Test Explorer plugin, will load your test assembly, use reflection to find all the tests within it, and invoke the tests to collect results. Unlike a regular library, test projects share some similarities with regular console applications:

  1. The test project's dependencies should be naturally loadable, as with any executable, from their own build output folder.
  2. When running multiple test projects, the loaded assemblies for test project A should be separate from the loaded assemblies for test project B.
  3. When the system under test relies on an App.config file, it should use the one local to the test project while the tests are running.



I'll call these behaviors the Big Three. The Big Three are so natural that you rarely find a need to even _say_ them. A test project should resemble a console executable: It should be able to have dependencies, it should not conflict with the assemblies loaded for another project, and each project should respect its own dedicated config file. We take this all for granted. The sky is blue, water is wet, and the Big Three must be honored as tests run.

### Fixie v1: Designing for the Big Three

The Big Three pose a _huge_ problem for .NET test frameworks: the primary running process, such as Visual Studio Test Explorer, is nowhere near the test project's build output folder. The most natural attempt to load a test project and run it will fail all of the Big Three.

Early alpha builds of Fixie were naive about assembly loading: The test runner .exe would load a test project and run simple tests, but it would fail as soon as a test tried to run code in another assembly—like the application being tested. By default, it searched for assemblies _near the test runner_, nowhere near the test project's build output folder.

Once we resolved that, using that test runner to run more than one test project would result in conflicts at runtime, such as when each test project referenced different versions of the same library.

And when we resolved that, the test runner would fail to look in the right config files, mistakenly thinking the test runner's config file was the one to use.

In the days of the regular old .NET Framework, the solution to the Big Three came in the form of AppDomains. AppDomains are a fairly old and now-deprecated technology. Fixie v1 was developed when this was the primary solution, with no deprecation in sight, to the Big Three. _Under those circumstances_, using AppDomains to solve the Big Three was the ideal design, though it was a bit frustrating to work with them. In short, they let a single test runner carve out little pockets of loaded assemblies with rigid communication boundaries between them.

![Fixie version 1][5]

The Test Explorer plugin and its own dependencies (like [Mono.Cecil][6]) live in one AppDomain. The test assembly and its dependencies live in a second AppDomain. A painful serialization boundary allows requests to cross the chasm with no risk of mixing the loaded assemblies.

AppDomains let you identify each test project's build output folder as the home of that test project's config file and dependencies. You could successfully load a test project's folder into the test runner process, call into it, and get test results while meeting the Big Three requirements.

And then .NET Core came along. Suddenly, AppDomains were an old and deprecated concept that simply would not continue to exist in the .NET Core world.

Circumstances had changed with a vengeance.

### Fixie v2: Adapting to the .NET Core crisis

At first, this seemed like the end of the Fixie project. The entire design depended on AppDomains, and if this newfangled .NET Core thing survived, Fixie would have no answer to the Big Three. Despair. Close up shop. Delete the repository.

In these moments of despair, we were making a classic software development mistake: confusing the _solution_ with the _requirements_. The _actual requirements_ (the Big Three) had not changed. The circumstances _around_ the design had changed: AppDomains were no longer available. When people make the mistake of confusing their solution with their requirements, they may double down, grip their steering wheel tighter, and just flail around while they try to force their solution to continue working.

Instead, we needed to recognize the plain truth: we had familiar requirements, but new circumstances, and it was time to throw out the old design for something new that met the same requirements under the new circumstances. Once we gave ourselves permission to go back to the drawing board, the solution was clear:

The Big Three let your "library" test project feel like a console application. So, what if your test project _was_ a console application?

A console application already has meaningful notions of loading dependencies from the right folder, distinct from the dependencies of another application, while respecting its own config file. The test runner is no longer the only process in the mix. Instead, the test runner's job is to _start_ the test project as a process of its own and communicate with it to collect results. We traded away AppDomains for interprocess communication, resulting in a new design that met all the original requirements while also working in the context of .NET Framework _and_ .NET Core projects.

![Fixie version 2][7]

This design kept the project alive and allowed us to serve both platforms during those shaky years when it wasn't certain which platform would survive in the long run. However, maintaining support for two worlds became increasingly painful, especially in keeping the Visual Studio Test Explorer plugin alive through every minor Visual Studio release. Every minor Fixie release involved a huge matrix of use cases to do regression testing, and every new little bump in the road brought innovation to a halt.

On top of that, Microsoft was starting to show clear signs that it was abandoning the .NET Framework: the old Framework no longer kept up with advances in .NET Standard, ASP.NET, or C#. The .NET Framework would exist but would quickly fall by the wayside.

Circumstances had changed again.

### Fixie v3: Embracing One .NET

Fixie v3 is a work in progress that we intend to release shortly after .NET 5 arrives. .NET 5 is the resolution to the .NET Framework vs. .NET Core development lines, arriving at [One .NET][8]. Instead of fighting it, we're following Microsoft's evolution: Fixie v3 will no longer run on the .NET Framework. Removing .NET Framework support allowed us to remove a lot of old, slow implementation details and dramatically simplified the regression testing scenarios we had to consider for reach release. It also allowed us to reconsider our design.

The Big Three requirements changed only slightly: .NET Core does away with the notion of an App.config file closely tied to your executable, instead relying on a more convention-based configuration. All of Fixie's assembly-loading requirements remained. More importantly, the circumstances _around_ the design changed in a fundamental way: we were no longer limited to using types available in both .NET Framework and .NET Core.

By promising _less_ with the removal of .NET Framework support, we _gained_ new degrees of freedom to modernize the system.

.NET's [AssemblyLoadContext][9] is a distant cousin of AppDomains. It's not available to the .NET Framework, so it hadn't been an option for us before. AssemblyLoadContext lets you set up a dedicated loading area for an assembly and its own dependencies without polluting the surrounding process and without being limited to the original process's own folder of assemblies. In other words, it gives AppDomains' "load this folder of assemblies off to the side" behavior without the frustrating AppDomains quirks.

We defined the concept of a **TestAssemblyLoadContext**, the little pocket of assembly-loading necessary for one test assembly folder:


```
class TestAssemblyLoadContext : AssemblyLoadContext
{
    readonly AssemblyDependencyResolver resolver;

    public TestAssemblyLoadContext(string testAssemblyPath)
        =&gt; resolver = [new][10] AssemblyDependencyResolver(testAssemblyPath);

    protected override Assembly? Load(AssemblyName assemblyName)
    {
        // Reuse the Fixie.dll already loaded in the containing process.
        if (assemblyName.Name == "Fixie")
            return null;

        var assemblyPath = resolver.ResolveAssemblyToPath(assemblyName);

        if (assemblyPath != null)
            return LoadFromAssemblyPath(assemblyPath);

        return null;
    }

    ...
}
```

Armed with this class, we can successfully load a test assembly and all its dependencies in a safe way and from the right folder. The test runner can work with the loaded Assembly directly, knowing that the loading effort won't pollute the test runner's own dependencies:


```
var assemblyName = [new][10] AssemblyName(Path.GetFileNameWithoutExtension(assemblyPath));
var testAssemblyLoadContext = [new][10] TestAssemblyLoadContext(assemblyPath);
var assembly = testAssemblyLoadContext.LoadFromAssemblyName(assemblyName);
// Use System.Reflection.* against `assembly` to find and run test methods...
```

We've come full circle: The Fixie v3 Visual Studio plugin uses TestAssemblyLoadContext to load test assemblies in process, similar to the way the Fixie v1 plugin did with AppDomains. The core Fixie.dll assembly need only be loaded once. Most importantly, we got to eliminate all the interprocess communication while taking advantage of the best that the new circumstances allowed.

![Fixie version 3][11]

### Always be designing

When you work with any long-lived system, some of your maintenance pains are really clues that outside circumstances have changed. If your circumstances are changing, take a step back and reconsider your design. Are you mistaking your _solution_ for your _requirements_? Articulate your requirements separate from your solution, and see whether your circumstances suggest a new and perhaps even exciting direction.

With news of Microsoft making the server side of .NET open source, we look at how the creation of...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/testing-net-fixie

作者：[Patrick Lioi][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/patricklioi
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://en.wikipedia.org/wiki/.NET_Framework
[3]: https://github.com/fixie/fixie
[4]: https://headspring.com/2020/04/01/fixie-test-framework-developer-ergonomics/
[5]: https://opensource.com/sites/default/files/fixie-design-diagram-v1-cropped.jpg (Fixie version 1)
[6]: https://www.mono-project.com/docs/tools+libraries/libraries/Mono.Cecil/
[7]: https://opensource.com/sites/default/files/fixie-design-diagram-v2-cropped_0.jpg (Fixie version 2)
[8]: https://channel9.msdn.com/Events/Build/2020/BOD106
[9]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/creating-app-with-plugin-support
[10]: http://www.google.com/search?q=new+msdn.microsoft.com
[11]: https://opensource.com/sites/default/files/fixie-design-diagram-v3-cropped_0.jpg (Fixie version 3)
