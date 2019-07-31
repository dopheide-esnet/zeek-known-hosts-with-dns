# @TEST-EXEC: bro -C -r $TRACES/known_host_test.pcap %INPUT
# @TEST-EXEC: bro-cut server_modes host name < known_hosts.log > known_hosts.tmp && mv known_hosts.tmp known_hosts.log
# @TEST-EXEC: btest-diff known_hosts.log

redef Site::local_nets += { [2001:400:0::]/32, 198.128.0.0/16 };

@load ../../../scripts/known-hosts-with-dns.bro
redef Known::use_host_store = F;
