-module(hello).
-export([output/0]).

output() ->
	code:purge(?MODULE),
	timer:sleep(5000),
	code:load_file(?MODULE),
	io:format("H"),
	?MODULE:output().

