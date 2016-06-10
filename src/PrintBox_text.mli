
(* This file is free software. See file "license" for more details. *)

(** {1 Render to Text}

    This module should be used to output boxes directly to a terminal, or
    another  area of monospace text *)

val set_string_len : (Bytes.t -> int) -> unit
(** Set which function is used to compute string length. Typically
    to be used with a unicode-sensitive length function
    An example of such function for utf8 encoded strings is the following
    (it uses the Uutf library):
    {[
      let string_leng s =
        let d = Uutf.decoder (`String s) in
        while (let c = Uutf.decode d in c <> `Await || c <> `End) do () done;
        Uutf.decoder_count d
    ]}
    Note that this function assumes there is no newline character in the given string.
    *)

val to_string : PrintBox.t -> string
(** Returns a string representation of the given structure. *)

val output : ?indent:int -> out_channel -> PrintBox.t -> unit
(** Outputs the given structure on the channel. *)
