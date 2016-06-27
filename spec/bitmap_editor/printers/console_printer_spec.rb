require 'spec_helper'
require 'printers/console_printer'

RSpec.describe BitmapEditor::ConsolePrinter do
  describe '.print' do
    context 'white bitmap' do
      let(:bitmap) { Array.new(3) { Array.new(3, 'O') } }

      it 'prints the bitmap correctly' do
        expect(STDOUT).to receive(:puts).with('OOO').exactly(3).times

        described_class.print(bitmap)
      end
    end

    context 'coloured bitmap' do
      let(:bitmap) do
        [
          %w(G G G G G G G),
          %w(W W W W W W W),
          %w(O O O O O O O)
        ]
      end

      it 'prints the bitmap correctly' do
        expect(STDOUT).to receive(:puts).with('G' * 7).once
        expect(STDOUT).to receive(:puts).with('W' * 7).once
        expect(STDOUT).to receive(:puts).with('O' * 7).once

        described_class.print(bitmap)
      end
    end
  end
end
