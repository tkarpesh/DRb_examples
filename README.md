# DRb (Distributed Ruby)

## What is it?

dRuby is a distributed object system exclusively for Ruby. More precisely, it’s a library for Remote Method Invocation (RMI). You can easily publish your objects to others, or call objects in other processes. The platforms which dRuby runs are able to exchange objects and also call methods on each other objects. dRuby can run on any machine that runs Ruby, irrespective of operating system.

![alt text](http://www.druby.org/ijpp/d2block.jpg "dRb OS")

## When I need to use it?

Imagine that you write a system that works with more than one process.
For example, you have a Web server that runs the background tasks running for a long time. Or you just need to provide data transfer from one process to another and coordinate them. For such situations you can use a library DRb. It is written entirely in Ruby, is included in the standard library, so it’s very ease to start working with it.

## How is dRuby different from other distributed object systems? What’s unique about it?

The biggest difference is that dRuby is designed for (and written in) Ruby. It is ridiculously easy to start using distributed object systems. dRuby inherits lots of good parts from Ruby. For example, you can use a method with block, and dRuby dynamically chooses how to send a remote object, so you don’t have to describe an interface or its transportation method.

dRuby is written completely in Ruby, not a special extension written in C. Thanks to Ruby's excellent thread, socket and marshalling class libraries, the initial version of dRuby was implemented in just 200 lines of code

Ruby programmers should find dRuby to be a comfortable, seamless extension of Ruby. Programmers accustomed to other conventional distributed object systems, however, may find dRuby to be a little strange.

## Benefits

dRuby also has the following benefits:

+ Easy to set-up.
+ Easy to learn.
+ Automatic selection of object transmission strategy (pass by value or pass by reference).
+ Reasonably fast.

## Really?

In dRuby, programmers do not need to explicitly specify whether to use pass-by-value or pass-by-reference. Instead, the system automatically decides which to use. This decision is made using a simple rule -- serializable objects are passed by value, while unserializable objects are passed by reference.

Although this rule may not always be correct, in most situations it will work. Here, I would like to briefly discuss this rule. Firstly, note that it is impossible for objects that cannot be serialized to be passed by value. The problematic case is where a serializable object that is more appropriately passed by reference is instead passed by value. To handle this case, dRuby provides a mechanism whereby serializable objects can be explicitly marked to be passed by reference.

## Problems

For example, the method of link back to you (not a copy) to the object generated directly in the method. If the server don’t save this object (for example, placed in a special hash), the server has no links to it. The client on the remote machine has, but the server - no! So GC will clean this object. This means that after a certain time reference type DRbObject client "rotten" and will point to nowhere. Trying to apply the methods of this object will cause an error.
Therefore, it is necessary to take care of the server to store references to objects returned at least as long as they are used by the server. There are several solutions:

+ to keep all passed by reference objects in the array - then the garbage collector will not collect them, because the links are used;
+ transfer the link (object_id) to the client in block.

There are other methods how to keep the remote object from GC. You can see them in [DRb book](https://pragprog.com/book/sidruby/the-druby-book)

## Usage

*Mostly it used for thread-safe simple apps.*

The most popular things, where dRb is used:

+ gem [‘spork’](https://github.com/sporkrb/spork) (spork/rails)
+ gem [‘pry-remote’](https://github.com/Mon-Ouie/pry-remote)
+ [Hatena screenshot service](http://www.hatena.ne.jp/tool/firefox#HatenaScreenshot)
+ [rails some usage](https://github.com/rails/rails/blob/7b7b12f5983fd0c48e4a8dad909d3388b72f046c/actionpack/test/abstract_unit.rb)
+ [rspec some usage](https://github.com/rspec/rspec-core/blob/1f011150e965b12b3a6ea5123084bc20a9567984/spec/rspec/core/drb_spec.rb)
