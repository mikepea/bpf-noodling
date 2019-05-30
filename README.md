# bpf-noodling

Playground for bpftrace and other eBPF/bcc learnings

## Key docs

* [bpftrace reference guide](https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md)

## Installation

### Ubuntu Bionic

    # via https://github.com/iovisor/bpftrace/issues/642
    # - need to install snap with --devmode otherwise cannot read files
    sudo snap install --devmode bpftrace

    # via https://snapcraft.io/bpftrace
    sudo snap connect bpftrace:system-trace

## bfptrace in 60 seconds

* AWK-like syntax
* attaches probes to code blocks, via optional filters like /pid=12345/, /arg2 > 16/
* build in variables:
  * comm: process name
  * pid/tid/uid/gid/retval: what you'd expect
  * cgroup: cgroup id of process
  * cpu: cpu id
  * $1..$N: positional params of bpftrace program
  * [full list](https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md#variables)
* can also access C Struct vars using '->' notation
  * eg 'str(args->filename)'
  * see (eg) /sys/kernel/debug/tracing/events/syscalls/sys_enter_open/format
    for the available vars for a given syscall
  * [reference guide on this](https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md#4---c-struct-navigation)
* Lots of probes in distinct categories
  * [probe categories](https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md#probes)
  * 'pbfprobe -l' to list all
  * some are 'paired', with call entry and return, eg kprobe, kretprobe.
* Has global (@) and scratch ($) variables, and global maps (@name[key])
  * 'thread local' variables provided by using map on 'tid', eg @start[tid]
  * [reference guide on variables](https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md#variables)
* Bunch of useful bpftrace tools in [bpftrace github repo](https://github.com/iovisor/bpftrace/blob/master/tools)

## Useful Links 

* [bpftrace one liners](https://github.com/iovisor/bpftrace/blob/master/docs/tutorial_one_liners.md)
* [bpftrace reference](https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md)
* [BG's Learn eBPF](https://medium.com/netflix-techblog/linux-performance-analysis-in-60-000-milliseconds-accc10403c55)
* [Netflix's performance in 60s](https://medium.com/netflix-techblog/linux-performance-analysis-in-60-000-milliseconds-accc10403c55)
* [Linux syscalls](https://github.com/torvalds/linux/blob/16f73eb02d7e1765ccab3d2018e0bd98eb93d973/arch/x86/entry/syscalls/syscall_64.tbl)
* [Linux insides book](https://0xax.gitbooks.io/linux-insides/content/Theory/linux-theory-1.html)
