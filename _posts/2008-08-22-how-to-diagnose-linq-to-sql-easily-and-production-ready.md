---
layout: post
title: "Daniel Cazzulino's Blog - How to diagnose Linq to SQL easily and production-ready"
date: 2008-08-22 00:00:00 +0000
---

## How to diagnose Linq to SQL easily and production-ready 

Here's what we're currently doing: we add an InitializeContext method to all DataContext-derived classes, which is called from all ctors:
    
    
        private void InitializeContext()
        {
    #if DEBUG
            if (Debugger.IsAttached)
            {
                this.Log = new DebuggerTextWriter();
            }
    #endif
        }
    

Note that the logger will only be set if a debugger is attached, so that it doesn't pollute the output on a console app while you're running it. 

The DebuggerTextWriter is trivial too:
    
    
    #if DEBUG
        internal class DebuggerTextWriter : TextWriter
        {
            public override void Write(string value)
            {
                Debugger.Log(0, "", value);
                Console.Write(value);
            }
    
            public override void WriteLine(string value)
            {
                Debugger.Log(0, "", value + Environment.NewLine);
                Console.WriteLine(value);
            }
    
            public override Encoding Encoding
            {
                get { return System.Text.Encoding.UTF8; }
            }
        }
    #endif
    

[](http://11011.net/software/vspaste)

In both cases I'm wrapping the code in #if DEBUG so that it doesn't even go to production code. The debugger writer will write to the console output as well as the VS debugger output window.

/kzu
