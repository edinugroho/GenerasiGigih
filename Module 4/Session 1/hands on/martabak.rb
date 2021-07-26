class Martabak
    attr_reader :toping

    def initialize(toping)
        @toping = toping
    end

    def taste
        "martabak #{@toping} is delicious"
    end
end