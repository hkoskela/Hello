-module(hello).
-export([start/0,incr/1,output/0,loop/1]).
-vsn(2.0).

start() ->
	Pid = spawn(?MODULE,output,[]).

incr(N) ->
	N + 1.

output() ->
	N = 0,
	loop(N).
    
loop(N) ->	
	code:soft_purge(?MODULE),
    timer:sleep(3000),
	code:load_file(?MODULE),
    timer:sleep(2000),
	V = ?MODULE:module_info(attributes),
	New = ?MODULE:incr(N),
	T = calendar:now_to_local_time(now()),
    Message = 5,
	io:format("~p ~p Ajettu ~p kertaa: ~p ~n", [T,V,New,Message]),
    ?MODULE:loop(New).

