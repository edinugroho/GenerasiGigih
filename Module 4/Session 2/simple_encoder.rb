class SimpleEncoder
    def encode(input)
        if input != ''
            ord = input.ord
            new_ord = ord + 9
            new_ord.chr
        else
            ''
        end
    end
end