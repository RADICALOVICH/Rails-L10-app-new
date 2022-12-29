# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SequenceResult, type: :model do
  # тестируем валидации
  describe 'validations' do
    # тестируем, что модель проверяет наличие параметров и выводит соответствующее сообщение
    it { should validate_presence_of(:number).with_message("can't be blank") }
    it { should validate_presence_of(:string_array).with_message("can't be blank") }

    context 'when number is not digits' do
      it { should_not allow_value(Faker::Lorem.word).for(:number) }
    end

    context 'when string is invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:string_array) }
    end
  end
end