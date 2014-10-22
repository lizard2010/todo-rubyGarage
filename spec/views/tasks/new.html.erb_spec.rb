require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :name => "MyString",
      :project => nil,
      :prio => false,
      :done => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "input#task_project[name=?]", "task[project]"
      assert_select "input#task_prio[name=?]", "task[prio]"
      assert_select "input#task_done[name=?]", "task[done]"
    end
  end
end
