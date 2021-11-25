fun countChar (c: char) (str: string) : int =
  let
    fun listCount acc [] = acc
      | listCount acc (x::xs) = if c = x then listCount (acc + 1) xs else listCount acc xs;
  in
    listCount 0 (explode str)
  end;