class WhoLikesIt
    attr_reader :names

    def initialize(names)
        @names = names
    end

    def likes
        if @names.length == 0
            "no one likes this"
        elsif @names.length == 1
            "#{names[0]} likes this"
        elsif @names.length == 2
            "#{names[0]} and #{names[1]} like this"
        elsif @names.length == 3
            "#{names[0]}, #{names[1]} and #{names[2]} like this"
        elsif @names.length >= 4
            "#{names[0]}, #{names[1]} and #{names.length - 2} others like this"
        end
    end
end