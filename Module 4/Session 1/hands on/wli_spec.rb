require_relative './wli.rb'

describe WhoLikesIt do
    it 'no likes' do
        wli = WhoLikesIt.new([])
        likes = wli.likes

        expect(likes).to eq("no one likes this")
    end

    it 'one like' do
        wli = WhoLikesIt.new(["jacob"])
        likes = wli.likes

        expect(likes).to eq("jacob likes this")
    end

    it 'two likes' do
        wli = WhoLikesIt.new(["jacob", "alex"])
        likes = wli.likes

        expect(likes).to eq("jacob and alex like this")
    end

    it 'three likes' do
        wli = WhoLikesIt.new(["jacob", "alex", "mark"])
        likes = wli.likes

        expect(likes).to eq("jacob, alex and mark like this")
    end

    it 'many likes' do
        wli = WhoLikesIt.new(["jacob", "alex", "mark", "max"])
        likes = wli.likes

        expect(likes).to eq("jacob, alex and 2 others like this")
    end
end