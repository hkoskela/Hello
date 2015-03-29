-module(hello).
-export([start/0,incr/1,init/0,loop/1,update/0]).
-vsn(2.28).

start() ->
	spawn(?MODULE,init,[]).

incr(N) ->
	N + 1.

update() ->
	code:purge(?MODULE),
	timer:sleep(1000),
	code:load_file(?MODULE),
	timer:sleep(2000).

init() ->
	N = 0,
	loop(N).
    
loop(N) ->	
	?MODULE:update(),
	{_,{_,[V]}}= beam_lib:version(?MODULE),
	New = ?MODULE:incr(N),
	T = calendar:now_to_local_time(now()),
    Message = "ruokaa",
	io:format("~p Versio: ~p Ajettu ~p kertaa ~p ~n", [T,V,New,Message]),
	timer:sleep(5000),
    ?MODULE:loop(New).

