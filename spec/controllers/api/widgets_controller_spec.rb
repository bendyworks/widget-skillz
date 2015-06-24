require 'rails_helper'

describe Api::WidgetsController do
  let!(:widget) { create(:widget) }

  describe '#index' do
    it 'returns a list of widgets' do
      get(:index)
      expect(response.body).to eq({ 'widgets' => Widget.all }.to_json)
    end
  end
end
