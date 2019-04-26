# Execute both applications in a custom shell. The setup for both applications
# (i.e., setting priority, affinity) is done by the shell prior to their launch
# (i.e., exec). The aim is to understand how well synchronized the applications
# can be made without putting explicit synchronization barriers in their source
# code or before their launch.
#
# This is the best synchronization we can get by just carefully launching the
# applications.

trace-cmd record -e sched_switch ./shell
mv trace.dat tr_exp3.dat
