require 'rails_helper'

describe Api::WidgetsController do
  let!(:widget) { create(:widget) }

  describe '#index' do
    it 'returns a list of widgets' do
      get(:index)
      expect(response.body).to eq({'widgets' => Widget.all}.to_json)
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
      expect(response.body).to eq(widget.reload.to_json(root: true))
    end

    context 'with json fields' do
      let(:widget) { create(:widget, template_fields: {title: 'mr'}) }
      let(:template_fields) { {start_date: '1-1-2015'} }

      let(:widget_json_params) do
        { id: widget.id,
          widget: {
            id: widget.id,
            template_fields: template_fields } }
      end

      it 'replaces existing json fields with param values' do
        put(:update, widget_json_params)
        expect(widget.reload.template_fields).to eq(template_fields.as_json)
      end
    end
  end

  describe "#create" do
    let(:widget_create_params) do
      { widget: attributes_for(:widget) }
    end

    it 'creates a widget' do
      expect do
        post(:create, widget_create_params)
      end.to change{Widget.count}.by(1)
    end

    context 'with json fields' do
      let(:template_fields) { {start_date: '1-1-2015'} }
      let(:widget) do
        attributes_for(:widget, template_fields: template_fields)
      end

      let(:widget_json_params) do
        { widget: widget }
      end

      it 'replaces existing json fields with param values' do
        post(:create, widget_json_params)
        expect(assigns[:widget].template_fields).to eq(template_fields.as_json)
      end
    end
  end

  describe "#destroy" do
    it 'destroys a widget' do
      expect do
        delete(:destroy, id: widget.id)
      end.to change{Widget.count}.by(-1)
    end
  end

  describe "#show" do
    it 'returns a widget' do
      get(:show, id: widget.id)
      expect(response.body).to eq(widget.to_json(root: true))
    end
  end
end
