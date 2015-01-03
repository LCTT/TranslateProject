一些关于Java的句子
================================================================================
本文并没有什么新鲜的。我只是收集了一些不太重要的语句，但这些语句可能对初级程序员来说很重要。也就是些无聊的旧东西。

如果以下的这些你都知道的话，那么你比Java的了解已经超过了对一个平常的家庭主妇的了解。我不知道清楚所有的这些是否是有意义的。即使不知道其中的一些特性，你照样也可以成为一个相当不错的Java程序员。然而，本文中许多的新信息可能表明你还有很大的发展空间。

### Java中有四种不同的访问类型(而不是三种) ###

这四种类型包括：`private`, package private (包访问权限，无修饰符，又叫default, 译者注)。如果你在类中定义一个元素时并不加任何访问类型修饰符，它将被默认设置为包访问权限(package private)，而不是`public`或者`protected`。

![Java中有四种级别的访问类型](http://a3ab771892fd198a96736e50.javacodegeeks.netdna-cdn.com/wp-content/uploads/2014/11/four-levels-of-protection.png)

*Java有四个级别的访问类型。*

从另一方面来说，如果在接口中，你不指定方法的访问修饰符，那么它将是`public`类型的。你也可以显式地指定它为`public`类型， 但这并不符合SONAR（一个开源代码质量管理平台，译者注）的代码质量管理思想。

![访问类型是传递的](http://a3ab771892fd198a96736e50.javacodegeeks.netdna-cdn.com/wp-content/uploads/2014/11/protection-is-transitive.png)

*访问类型是传递的*

> 我的“在Java中允许选择性的在接口的方法中写`public`”的观点是一个技术错误。

同样你也可在接口的字段前写`final`，甚至是`static`。这说明这些字段可以是非静态或非final吗？不是的，接口中的字段中总是final和static的。

### Protected和package private是不一样的 ###

Package private（或者default）访问类型可以使得相同包(package)下其他类能够访问这些字段或方法。保护类型(`protected`)的方法和字段可以被相同包下的类使用(这和package private是一样的)，同时它也可以被其他类使用，只要那个类继承了这个包含这些`protected`方法或字段的类。

### Protected是可传递的 ###

如果有三个包a、b、c，每个包都分别包含A、B、C类，而且B继承A，C继承B，那么C可以访问A中的protected字段和方法。

    package a;
    
    public class A {
    	protected void a() {
    
    	}
    }
    package b;
    
    import a.A;
    
    public class B extends A {
    	protected void b() {
    		a();
    	}
    }
    package c;
    
    import b.B;
    
    public class C extends B {
    	protected void c() {
    		a();
    	}
    }

### 接口不能定义protected方法 ###

很多人认为可以在接口中定义`protected`方法。如果你这么做的话，编译器很快就会毫不留情地给你报错。顺便说下，这也就是我为什么认为允许`public`关键字在接口中是一个技术错误，它会让人觉得还可以写其他访问类型似的。

![Private is the new public](http://a3ab771892fd198a96736e50.javacodegeeks.netdna-cdn.com/wp-content/uploads/2014/11/private-is-the-new-public.png)

*private是一种新的public*

如果你还想在一个接口的方法中声明protected方法,你可能还不理解封装的含义。

### 此private非彼private ###

私有变量和方法在编译单元内是可见的。如果这听起来太神秘的话，换种说法：几乎就是在同一个Java文件中。这比“在它们被定义的类中”听起来好理解些。它们在同一编译单元的类和接口中也是可见的。嵌套类可以看到类中封装的私有字段和方法。然而，当前封闭类也可以看到该类下任何深度下类中的私有方法和字段。

    package a;
    
    class Private {
    	private class PrivateInPrivate {
    		private Object object;
    	}
    
    	Object m() {
    		return new PrivateInPrivate().object;
    	}
    }

后者并不广为人知，事实上也很少有用到。

### Private是类的访问级别而不是对象 ###

如果你可以访问一个变量或方法，那么不管它属于哪个对象你都可以访问它。如果`this.a`可以访问到，那`another.a`也可以访问到，只要它们是同一个类的实例。同一个类的实例对象可以随意调用其他实例的变量或方法。不过这样的代码一般都没有意义。现实生活中异常是`equals()`(由Eclipse生成， 15 - 18行)：

    package a;
    
    public class PrivateIsClass {
    	private Object object;
    
    	@Override
    	public boolean equals(Object obj) {
    		if (this == obj)
    			return true;
    		if (obj == null)
    			return false;
    		if (getClass() != obj.getClass())
    			return false;
    		PrivateIsClass other = (PrivateIsClass) obj;
    		if (object == null) {
    			if (other.object != null)
    				return false;
    		} else if (!object.equals(other.object))
    			return false;
    		return true;
    	}
    }

###静态(static)类可能有很多实例 ###

![Protection is not object level. It is class level.](http://a3ab771892fd198a96736e50.javacodegeeks.netdna-cdn.com/wp-content/uploads/2014/11/protection-is-class-feature.png)

*访问类型不是对象级别的而是类级别的。*

那些不支持有任何实例的类，通常被称为实用工具类。它们只包含静态字段和静态方法以及唯一的不被该类的任何静态方法调用的私有构造函数。在Java 8中也可以有这样的一个野兽(这个词翻译不通，译者注)在接口中实现，因为Java 8的接口可以有静态方法。我不觉得我们应该使用这个特性而不是实用工具类。我也不完全确信我们应该使用实用工具类。

静态类总是在另一个类或接口中。它们是嵌套类。他们是静态的,就像静态方法不能访问类的实例方法和字段一样，静态内部类也不能访问嵌入类的实例方法和字段。这是因为内部类没有嵌入类实例的引用（或者说是指针，如果你喜欢这么叫的话）。内部类（内部类,也即非静态嵌套类, 译者注)，而非静态嵌套类, 没有嵌入类的一个实例，它是无法被创建的。每个内部类的实例都具有嵌入类实例的一个引用，因此一个内部类可以访问嵌入类的实例方法和字段。

因为这个原因，要是没有外部类的一个实例，你就不能创建一个内部类。当然，如果是当前对象，也就是`this`的话，你就可以不需要指定它。在这种情况下你可以使用`new`, 在这种情况下,也就是`this.new`的简式。在一个静态的环境中,例如从一个静态方法，你必须指定内部类应该创建哪个封闭类的实例。见第10行:

    package a;
    
    class Nesting {
    	static class Nested {}
    	class Inner {}
    	void method(){
    		Inner inner = new Inner();
    	}
    	static void staticMethod(){
    		Inner inner = new Nesting().new Inner();
    	}
    }

### 匿名类只能访问final变量 ###

![Variable has to be effective final](http://a3ab771892fd198a96736e50.javacodegeeks.netdna-cdn.com/wp-content/uploads/2014/11/effective-final.png)

*变量必须是有效的final*

当一个匿名类被定义在一个方法中，它可以访问局部变量如果该变量是`final`的。但这说的有点模糊。它们不得不声明成final,他们还必须是有效final。这也是Java 8中发布的一些特性。你不需要声明这些变量为`final`型，但它们仍然必须是有效的`final`。

![Java 8 does not require final, only effective final](http://a3ab771892fd198a96736e50.javacodegeeks.netdna-cdn.com/wp-content/uploads/2014/11/java_ee_-_javabeantester_src_main_java_com_javax0_jbt_blog_java_-_eclipse_-__users_verhasp_github_javax_blog.png)

*Java 8并不要求`final`，只要求有效final。*

为什么你需要对一些东西声明`final`,当它被检查必须是这样的。就像方法的参数。它们也必须是`final`的。你说这不是Java所必须的吗?嗯,你是对的。这只是一个良好的编程风格所必须的。

--------------------------------------------------------------------------------

via: http://www.javacodegeeks.com/2014/11/some-sentences-about-java.html

作者：[Peter Verhas][a]
译者：[a598799539](https://github.com/a598799539)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.javacodegeeks.com/author/peter-verhas/
