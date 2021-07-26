require_relative './martabak.rb'

describe Martabak do #group test buat martabak
    it 'is delicious' do #skenarionya
        martabak = Martabak.new('telor') #instance object (given)
        taste = martabak.taste #function call (when)

        expect(taste).to eq("martabak telor is delicious") #assertion (then)
    end
end