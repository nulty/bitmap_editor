require 'spec_helper'
require 'command'

RSpec.describe BitmapEditor::Command do
  describe '#run' do
    subject { described_class.new }

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

    context 'unrecognised command' do
      it 'prints the help command' do
        expect(STDOUT).to receive(:puts).with('unrecognised command :(')
        subject.run('unrecognised_command')
      end
    end
  end
end
