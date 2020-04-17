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

    src_text = open(src, "r") do src_f
        read(src_f, String)
    end

    # parse the tree from the file contents
    representation = Representer(src_text)

    # save dump of the initial tree for debug
    # out = "# BEGIN TREE BEFORE" * dump_tree(representation)

    # normalize the tree
    # representation = normalize(representation)

    # save dump of the normalized tree for debug
    # out *= "# BEGIN TREE AFTER" * dump_tree(representation)

    # dump the representation files
    
    # open(debug_out_dest, "w") do dest_f
    #     write(dest_f, out)
    # end
        
    open(text_dest, "w") do dest_f
        write(dest_f, dump_code(representation))
    end
    
    # open(map_dest, "w") do dest_f
    #    write(dest_f, dump_map(representation))
    # end
    
end

end
