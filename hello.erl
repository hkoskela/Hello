-module(hello).
-export([start/0,incr/1,init/0,loop/1,update/0]).
-vsn(2.61).

start() ->
	spawn(?MODULE,init,[]).

incr(N) ->
	N + 1.

update() ->
	code:purge(?MODULE),
	code:load_file(?MODULE).
	
init() ->
	N = 0,
	loop(N).
    
loop(N) ->	
	?MODULE:update(),
	{ok,{hello,[V]}} = beam_lib:version(hello),
	New = ?MODULE:incr(N),
	{H,M,S} = time(),
	Message = "1",
	io:format("(~p:~p:~p) Versio: ~p Ajettu ~p kertaa ~p ~n", [H,M,S,V,New,Message]),
	timer:sleep(5000),
    ?MODULE:loop(New).

