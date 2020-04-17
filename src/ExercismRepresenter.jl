module ExercismRepresenter

include("util.jl")

struct Representer
    tree :: Expr
end

Representer(text::AbstractString) = Representer(Meta.parse(text))

function dump_code(representer::Representer)
    repr(representer.tree)
end

# Write your package code here.
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
    # out = ["# BEGIN TREE BEFORE", representation.dump_tree(), ""]

    # normalize the tree
    # normalize(representation)

    # save dump of the normalized tree for debug
    # out.extend(["# BEGIN TREE AFTER", representation.dump_tree()])

    # dump the representation files
    # debug_out_dest.write_text("\n".join(out))
    open(text_dest, "w") do dest_f
        write(dest_f, dump_code(representation))
    end
    # map_dest.write_text(representation.dump_map())
    
end

end
