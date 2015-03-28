-module(hello).
-export([start/0,incr/1,init/0,loop/1,update/0]).
-vsn(2.05).

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
	V = ?MODULE:module_info(attributes),
	New = ?MODULE:incr(N),
	T = calendar:now_to_local_time(now()),
    Message = "5",
	io:format("~p ~p Ajettu ~p kertaa: ~p ~n", [T,V,New,Message]),
	timer:sleep(5000),
    ?MODULE:loop(New).

