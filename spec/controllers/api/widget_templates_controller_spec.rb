require 'rails_helper'

describe Api::WidgetTemplatesController do
  let!(:widget_template) { create(:widget_template) }

  describe '#index' do
    it 'returns a list of widget_templates' do
      get(:index)
      expect(response.body).to eq({'widget_templates' => WidgetTemplate.all}.to_json)
    end
  end

  describe '#update' do
    let(:widget_template_update_params) do
      { id: widget_template.id,
        widget_template: {
          id: widget_template.id,
          title: "new widget_template title" } }
    end

    it 'updates the widget_template' do
      put(:update, widget_template_update_params)
      expect(response.code).to eq('200')
      expect(widget_template.reload.title).to eq(widget_template_update_params[:widget_template][:title])
    end

    it 'returns wrapped object' do
      put(:update, widget_template_update_params)
      expect(response.code).to eq('200')
      expect(response.body).to eq(widget_template.reload.to_json(root: true))
    end

    context 'with json fields' do
      let(:widget_template) { create(:widget_template, fields: {title: :text}) }
      let(:widget_template_fields) { {start_date: :date} }

      let(:widget_template_json_params) do
        { id: widget_template.id,
          widget_template: {
            id: widget_template.id,
            fields: widget_template_fields } }
      end

      it 'replaces existing json fields with param values' do
        put(:update, widget_template_json_params)
        expect(widget_template.reload.fields).to eq(widget_template_fields.as_json)
      end
    end
  end

  describe "#create" do
    let(:widget_template_create_params) do
      { widget_template: attributes_for(:widget_template) }
    end

    it 'creates a widget_template' do
      expect do
        post(:create, widget_template_create_params)
      end.to change{WidgetTemplate.count}.by(1)
    end

    context 'with json fields' do
      let(:widget_template_fields) { {start_date: :date} }
      let(:widget_template) do
        attributes_for(:widget_template, fields: widget_template_fields)
      end

      let(:widget_template_json_params) do
        { widget_template: widget_template }
      end

      it 'replaces existing json fields with param values' do
        post(:create, widget_template_json_params)
        expect(assigns[:widget_template].fields).to eq(widget_template_fields.as_json)
      end
    end
  end

  describe "#destroy" do
    it 'destroys a widget_template' do
      expect do
        delete(:destroy, id: widget_template.id)
      end.to change{WidgetTemplate.count}.by(-1)
    end
  end

  describe "#show" do
    it 'returns a widget_template' do
      get(:show, id: widget_template.id)
      expect(response.body).to eq(widget_template.to_json(root: true))
    end
  end
end

