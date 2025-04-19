To successfully build this image, you have to copy the folder (`spec`) containing the `spec2017` benchmarks inside this directory.

Then simply run
```sh
make build
```

To run a specific benchmark, run:
```
make run BENCHMARK="<benchmark_name>"
```

For example:
```sh
make run BENCHMARK="600.perlbench_s"

Running SPEC benchmark: 600.perlbench_s (size=ref, config=myconfig)
SPEC CPU(r) 2017 Benchmark Suites
Copyright 1995-2017 Standard Performance Evaluation Corporation (SPEC)

runcpu v5825
Using 'linux-x86_64' tools
Reading file manifests... read 32325 entries from 2 files in 0.09s (373928 files/s)
Loading runcpu modules.................
Locating benchmarks...found 47 benchmarks in 53 benchsets.
Reading config file '/opt/spec/config/myconfig.cfg'
1 configuration selected:

 Action    Run Mode   Workload      Report Type      Benchmarks
--------   --------   --------   -----------------   --------------------------
validate   speed      refspeed   SPECspeed2017_int   600.perlbench_s
-------------------------------------------------------------------------------

Setting up environment for running 600.perlbench_s...
Starting runcpu for 600.perlbench_s...
Running "specperl /opt/spec/bin/sysinfo" to gather system information.
sysinfo: r5797 of 2017-06-14 (96c45e4568ad54c135fd618bcc091c0f)
sysinfo: Getting system information for Linux...
sysinfo: ...getting CPU info
sysinfo: ...getting info from numactl
sysinfo: ...getting memory info
sysinfo: ...getting OS info
sysinfo: ...getting disk info
Retrieving flags file (/opt/spec/config/flags/gcc.xml)...
Benchmarks selected: 600.perlbench_s
Compiling Binaries
  Up to date 600.perlbench_s base mytest-m64


Setting Up Run Directories
  Setting up 600.perlbench_s refspeed (ref) base mytest-m64:
Notice: Unusable path detected in run directory list file at
        /opt/spec/benchspec/CPU/600.perlbench_s/run/list
        The list file references one or more paths which will be
        ignored because they are not subdirectories of the directory
        where the list file resides.  This condition may be a result of
        having moved your SPEC CPU2017 benchmark tree.  If that's what
        happened, and if you don't need the old run directories, you
        can just remove them, along with the list file.  (Usually it's
        safe to delete old run directories, as they are automatically
        re-created when needed.)
run_base_refspeed_mytest-m64.0001
Running Benchmarks
  Running 600.perlbench_s refspeed (ref) base mytest-m64 threads:4 [2025-04-19 15:14:32]
Success: 1x600.perlbench_s
Producing Raw Reports
 label: mytest-m64
  workload: refspeed (ref)
   metric: SPECspeed2017_int_base
    format: raw -> /opt/spec/result/CPU2017.008.intspeed.refspeed.rsf
Parsing flags for 600.perlbench_s base: done
Doing flag reduction: done
    format: flags -> /opt/spec/result/CPU2017.008.intspeed.refspeed.flags.html
    format: cfg -> /opt/spec/result/CPU2017.008.intspeed.refspeed.cfg, /opt/spec/result/CPU2017.008.intspeed.refspeed.orig.cfg
    format: CSV -> /opt/spec/result/CPU2017.008.intspeed.refspeed.csv
    format: PDF -> /opt/spec/result/CPU2017.008.intspeed.refspeed.pdf
    format: HTML -> /opt/spec/result/CPU2017.008.intspeed.refspeed.html
    format: Text -> /opt/spec/result/CPU2017.008.intspeed.refspeed.txt
The log for this run is in /opt/spec/result/CPU2017.008.log

runcpu finished at 2025-04-19 15:19:56; 327 total seconds elapsed
```