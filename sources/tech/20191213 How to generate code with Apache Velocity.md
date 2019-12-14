[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to generate code with Apache Velocity)
[#]: via: (https://opensource.com/article/19/12/generate-code-apache-velocity)
[#]: author: (Girish Managoli https://opensource.com/users/gammay)

How to generate code with Apache Velocity
======
Get started with Velocity, an open source, Java-based template engine
and code generator that converts templates into source code.
![Binary code on a computer screen][1]

Apache [Velocity][2] is an open source, Java-based template engine and code generator that converts templates into source code. Because it is implemented in Java, it is capable of interpreting varied templates and generating code for any language (web, service, SQL, scripts, etc.), although it seems to be oriented mostly toward web development.

## Velocity's structure

Velocity's structure is comprised of an engine and tools. Its core is the Velocity Engine, which uses the defined template, interprets the template language, and generates the code.

Templates are defined with Velocity Template Language ([VTL][3]), a simple language with effective directives. VTL statements are directives or variables, and variables can be standalone or class methods.

Examples of VTL expressions include:


```
`package ${packagename};`[/code] | Inserts a package statement in Java where the package name is defined as **packagename**
---|---
```
`public ${classname} implements Serializable {`[/code] | Adds a class with name **classname**

```
 #foreach( $property in $properties )
 public ${property.fieldType} get${property.getField()}() {
     return this.${property.fieldName};
 }
#end [/code] | Creates getter methods for all defined properties

Velocity tools are collections of basic user-friendly capabilities. There are [GenericTools][4], a "set of classes that provide basic infrastructure for using tools in standard Java SE Velocity projects, as well as a set of tools for use in generic Velocity templates." They include DateTool, MathTool, NumberTool, SortTool, and XmlTool. There are also [VelocityView][5] tools, which include "all of the GenericTools and adds infrastructure and specialized tools for using Velocity in the view layer of web applications (Java EE projects)." VelocityView tools include BrowserTool, CookieTool, and ImportTool

## Velocity advantages and disadvantages

Velocity is easy to use and has the capability to generate any language. On the downside, there is a learning curve to understand and apply its template language. Velocity is morphology- and ontology-free. It has no knowledge of the design capability of the module it generates. As a practical example, Velocity may use a template for a controller (e.g., Model-View-Controller or an architecture style) and generate the code, but it has no awareness of the concept of a controller. This is both an advantage and disadvantage, with a generator being simple and easy to use but with no awareness of the design's aptitude.

## Using Velocity

Velocity's Java library is available on the [Maven repository][6]. To use the .jar file, define Velocity's latest version in your Maven build config. (Velocity 1.7 is the latest version, as of this writing.) For example, enter the following in your Maven Project Object Model (POM):
```


&lt;dependency&gt;
        &lt;groupId&gt;org.apache.velocity&lt;/groupId&gt;
        &lt;artifactId&gt;velocity&lt;/artifactId&gt;
        &lt;version&gt;1.7&lt;/version&gt;
&lt;/dependency&gt;

```
### Java Hello World example

To generate code, you need two things:

  1. The **Velocity template** to be used for generation, e.g., java_example.vm: [code] public class ${className} {

    public static void main([String][7][] args) {
        [System][8].out.println("${message}");
    }

}
```



  2. The **Velocity generator** that uses the template to generate code, e.g., VelocityStartGenerator.java: [code] public class VelocityStartGenerator {
 
    static [String][7] inputTemplate = "java_example.vm";
    static [String][7] className = "VelocityExample";
    static [String][7] message = "Hello World!";
    static [String][7] outputFile = className + ".java";
       
    public static void main([String][7][] args) throws [IOException][9] {
       
        VelocityEngine velocityEngine = new VelocityEngine();
        velocityEngine.init();
     
        VelocityContext context = new VelocityContext();
        context.put("className", className);
 