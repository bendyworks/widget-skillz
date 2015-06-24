require 'rails_helper'

describe Api::WidgetsController do
  let!(:widget) { create(:widget) }

  describe '#index' do
    it 'returns a list of widgets' do
      get(:index)
      expect(response.body).to eq({ 'widgets' => Widget.all }.to_json)
    end
  end

  describe '#update' do
    let(:widget_update_params) do
      { id: widget.id,
        widget: {
          id: widget.id,
          name: "new widget name" } }
    end

    it 'updates the widget' do
      put(:update, widget_update_params)
      expect(response.code).to eq('200')
      expect(widget.reload.name).to eq(widget_update_params[:widget][:name])
    end

    it 'returns wrapped object' do
      put(:update, widget_update_params)
      expect(response.code).to eq('200')
      expect(response.body).to eq({'widget' => widget.reload}.to_json)
    end
  end
end
