require 'spec_helper'
require 'command'

RSpec.describe BitmapEditor::Command do
  describe '#run' do
    subject { described_class.new }
    let(:editor) { double }

    context '? - help command' do
      it 'prints the help command' do
        expect(subject).to receive(:show_help)
        subject.run('?')
      end
    end

    context 'X - exit command' do
      it 'prints the help command' do
        expect(subject).to receive(:exit_console)
        subject.run('X')
      end

      it 'prints the help command' do
        expect { subject.run('X') }.to change { subject.exit? }.from(false).to(true)
      end
    end

    context 'I - new Bitmap' do
      let(:input) { 'I 5 6' }
      let(:args) { %w(5 6) }

      it 'creates a new bitmap in the Editor' do
        expect(editor).to receive(:new_bitmap).with(*args)
        subject.run('I 5 6', editor)
      end
    end

    context 'unrecognised command' do
      it 'prints the help command' do
        expect(STDOUT).to receive(:puts).with('unrecognised command :(')
        subject.run('unrecognised_command')
      end
    end
  end
end
