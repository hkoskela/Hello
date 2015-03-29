-module(hello).
-export([start/0,incr/1,init/0,loop/1,update/0]).
-vsn(2.15).

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
	[{vns,[V]}] = ?MODULE:module_info(attributes),
	New = ?MODULE:incr(N),
	{{_},{H,Min,S}} = calendar:now_to_local_time(now()),
    Message = "Hoho",
	io:format("~p:~p:~p Versio: ~p Ajettu ~p kertaa ~p ~n", [H,Min,S,V,New,Message]),
	timer:sleep(5000),
    ?MODULE:loop(New).

