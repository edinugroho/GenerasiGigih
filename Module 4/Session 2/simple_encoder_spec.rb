require_relative './simple_encoder.rb'

describe SimpleEncoder do
    it 'should return empty string' do
        simple_encoder = SimpleEncoder.new
        encode = simple_encoder.encode
        expect(encode).to eq('')
    end
end