require 'spec_helper'

describe StyleStats::CLI do
  let(:files) { ['spec.css'] }
  let(:options) { {format: :json, user_agent: 'ios'} }

  describe '.run' do
    it do
      expect(StyleStats).to receive(:new).and_return(StyleStats.new(files))
      expect_any_instance_of(StyleStats).to receive(:render)
      StyleStats::CLI.run(files, options)
    end

    it do
      allow_any_instance_of(StyleStats).to receive(:render)
      StyleStats::CLI.run(files, options)
      expect(StyleStats::CLI.instance_variable_get(:@options)).to eq(options)
    end
  end

  describe 'private methods' do
    let(:user_agent_ios) { 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.4 Version/8.0 Safari/600.1.4' }
    let(:user_agent_android) { 'Mozilla/5.0 (Linux; Android 4.4.2; Nexus 5 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Mobile Safari/537.36' }

    before do
      StyleStats::CLI.instance_variable_set(:@options, options)
    end

    describe '.options' do
      it {
        expect(StyleStats::CLI.send(:options)).to eq({
          format: options[:format],
          user_agent: user_agent_ios
        })
      }
    end

    describe '.user_agent' do
      context 'when option user_agent string is ios' do
        it do
          options[:user_agent] = 'ios'
          expect(StyleStats::CLI.send(:user_agent)).to eq(user_agent_ios)
        end
      end

      context 'when options user_agent string is android' do
        it do
          options[:user_agent] = 'android'
          expect(StyleStats::CLI.send(:user_agent)).to eq(user_agent_android)
        end
      end

      context 'when other string' do
        it do
          options[:user_agent] = 'test'
          expect(StyleStats::CLI.send(:user_agent)).to eq('test')
        end
      end
    end
  end
end
