# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'powertop class' do
  context 'without any parameters' do
    include_examples 'the example', 'powertop_present.pp'

    describe package('powertop') do
      it { is_expected.to be_installed }
    end

    describe service('powertop') do
      it { is_expected.to be_enabled }
    end
  end

  context 'with parameters =>' do
    include_examples 'the example', 'powertop_absent.pp'

    describe package('powertop') do
      it { is_expected.not_to be_installed }
    end

    describe service('powertop') do
      it { is_expected.not_to be_enabled }
    end
  end
end
