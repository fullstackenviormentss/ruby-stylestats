require 'spec_helper'

describe StyleStats do
  let(:style_stats) { StyleStats.new(spec_css_path, options) }
  let(:options) { {format: :json} }

  describe '#initialize' do
    it 'set @options' do
      expect(style_stats.instance_variable_get(:@options)).to eq(options)
    end

    it 'call StyleStats::PathParser.new' do
      expect(StyleStats::PathParser).to receive(:new).with(spec_css_path).and_return(StyleStats::PathParser.new(spec_css_path))
      style_stats
    end

    it 'set instance of StyleStats::Css to @css ' do
      expect(style_stats.instance_variable_get(:@css)).to be_kind_of(StyleStats::Css)
    end
  end

  describe '#render' do
    it 'call StyleStats::Template#render' do
      expect_any_instance_of(StyleStats::Template).to receive(:render)
      style_stats.render
    end
  end

  it 'has a version number' do
    expect(StyleStats::VERSION).not_to be nil
  end
end
