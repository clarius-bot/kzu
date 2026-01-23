---
layout: post
title: "Complex traces you can actually understand by leveraging Activity Tracing"
date: 2014-01-14 00:00:00 +0000
---

##  [Complex traces you can actually understand by leveraging Activity Tracing](<http://blogs.clariusconsulting.net/kzu/complex-traces-you-can-actually-understand-by-leveraging-activity-tracing/> "Complex traces you can actually understand by leveraging Activity Tracing")

January 14, 2014 1:09 pm

Activity tracing is part of a feature that was initially introduced with WCF, named [End-to-End Tracing](<http://msdn.microsoft.com/en-us/library/aa738749\(v=vs.110\).aspx>). Its underlying implementation, however, is baked into the [XmlWriterTraceListener](<http://msdn.microsoft.com/en-us/library/system.diagnostics.xmlwritertracelistener\(v=vs.110\).aspx>) and does not depend on WCF in any way. Currently it’s only supported in the [SystemDiagnostics](<https://www.nuget.org/packages/tracer.systemdiagnostics>) implementation.

So what is activity tracing? It can be summarized as:

> Activity tracing are special traces that record the processing flow across threads, processes and even machines, allowing for later correlation

The activities are identified by an arbitrary guid, which is placed in the [ambient singleton](<http://blogs.clariusconsulting.net/kzu/a-better-way-to-implement-the-singleton-anti-pattern-for-easier-testing-using-ambientsingleton/>) property [Trace.CorrelationManager.ActivityId](<http://msdn.microsoft.com/en-us/library/system.diagnostics.correlationmanager.activityid\(v=vs.110\).aspx>). This ID flows with threads, and in the case of WCF, you can make it flow across processes and machines. This ID must be logged somehow, however, to be picked by a tool that can correlate the traces. For that purpose, this ID is tracked via[TraceSource.Transfer](<http://msdn.microsoft.com/en-us/library/system.diagnostics.tracesource.tracetransfer\(v=vs.110\).aspx>), [TraceEventType.Start and TraceEventType.Stop](<http://msdn.microsoft.com/en-us/library/system.diagnostics.traceeventtype\(v=vs.110\).aspx>) traces.

With the right traces and payloads in place, you can get some pretty amazing diagnostics going, with call graphs and all, as shown on [MSDN](<http://msdn.microsoft.com/en-us/library/aa751795\(v=vs.110\).aspx>). The following graph shows what a very complex set of traces could look like, involving several threads, an intermediate warning and an ultimate error that caused a build to fail on some remote build server:

[![Trace Viewer](https://github.com/clariuslabs/tracer/wiki/media/trace-viewer-build.png)](<https://github.com/clariuslabs/tracer/wiki/media/trace-viewer-build.png>)

This can be achieved rather easily using the Microsoft Service Trace Viewer, since it’s able to open multiple logs simultaneously and correlate activities automatically. There’s built-in searching and filtering too, and you can also see on the right side what was the trace source for each message, as well as extended information about the computer, thread, exception or even full stack traces.

The Service Trace Viewer tool is available at `C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\NETFX 4.0 Tools\SvcTraceViewer.exe`(or the folder of your installed version of the Windows SDK).

## [](<https://github.com/clariuslabs/tracer/wiki/Activity-Tracing#generating-trace-logs>)Generating Trace Logs

The first thing you need to do to generate these great XML logs that can be opened with the viewer is to set up the [XmlWriterTraceListener](<http://msdn.microsoft.com/en-us/library/system.diagnostics.xmlwritertracelistener\(v=vs.110\).aspx>) with the trace sources you want to log:
    
    
    var xmlListener = new XmlWriterTraceListener("log.xml");
    Tracer.Manager.AddListener("MyExtension", xmlListener);
    Tracer.Manager.SetTracingLevel("MyExtension", SourceLevels.All);
    

> Note: Tracer supports [Hierarchical Tracing](<https://github.com/clariuslabs/tracer/wiki/Hierarchical-Tracing>) and configuration.

Your calling code can now just issue normal traces as usual. In order to get activity tracing (those are the conected grouping lines in the graph above), you issue a `StartActivity` call on the tracer:
    
    
    private static readonly ITracer tracer = Tracer.Get<MyCommand>();
    ...
        using (tracer.StartActivity("Starting remote build"))
        {
            // start new tasks/threads, issue more traces, etc.
        }
    

Activities nest naturally, and the `using(..)` ensures that they are closed properly. Since the correlation is performed by activity identifier, it’s not necessary to wait for the related activities/tasks to complete before disposing (and therefore stopping) the parent activity.

This is part of the [Tracer](<https://github.com/clariuslabs/tracer>) project. This content will be updated on the [Activity Tracing wiki page](<https://github.com/clariuslabs/tracer/wiki/Activity-Tracing>).

/kzu
