module ExercismRepresenter

include("util.jl")

struct Representer
    tree :: Expr
end

Representer(text::AbstractString) = Representer(Meta.parse(text))

function dump_code(representer::Representer)
    repr(representer.tree)
end

function represent(directory::String, slug::String)
    src = joinpath(directory, slug*".jl")
    # debug_out_dest = joinpath(directory, "representation.out")
    text_dest = joinpath(directory, "representation.txt")
    # map_dest = joinpath(directory, "mapping.json")

    src_text = read(src, String)

    # parse the tree from the file contents
    representation = Representer(src_text)

    # save dump of the initial tree for debug
    # out = "# BEGIN TREE BEFORE" * dump_tree(representation)

    # normalize the tree
    # representation = normalize(representation)

    # save dump of the normalized tree for debug
    # out *= "# BEGIN TREE AFTER" * dump_tree(representation)

    # dump the representation files
    
    # write(debug_out_dest, out)
      
    write(text_dest, dump_code(representation))
    
    # write(map_dest, dump_map(representation))
    
end

end
