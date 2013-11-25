require 'spec_helper'

describe "galleries/new" do
  before(:each) do
    assign(:gallery, stub_model(Gallery,
      :product_id => nil,
      :photo_id => nil
    ).as_new_record)
  end

  it "renders new gallery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", galleries_path, "post" do
      assert_select "input#gallery_product_id[name=?]", "gallery[product_id]"
      assert_select "input#gallery_photo_id[name=?]", "gallery[photo_id]"
    end
  end
end
