-module(hello).
-export([incr/1,output/0,loop/1]).
-vsn(1.8).

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
    Message = 1,
	io:format("~p ~p Ajettu ~p kertaa: ~p ~n", [T,V,New,Message]),
    ?MODULE:loop(New).

