require './linked_list.rb'

describe "LinkedList" do
  let!(:node) { Node.new("1234") }
  let!(:value_1) { "5678" }
  let!(:value_2) { "8910" }
  let(:linked_list) { LinkedList.new }
  let(:linked_list_with_node) { LinkedList.new(node) }

  describe "#initialize" do
    context "when there is NOT a given first node" do
      it "sets the first node value to false" do
        linked_list.first_node.should == nil
      end
    end

    context "when there IS a given first node" do
      it "sets the given node to equal the first node" do
        linked_list_with_node.first_node.should == node
      end
    end
  end

  describe "#add" do
    
    context "when there are NO existing nodes in the list" do
      it "sets the given node to the first node" do
        linked_list.add(value_1)
        linked_list.first_node.value.should == value_1
      end
    end

    context "when there are already nodes in the lists" do
      it "sets the given node to be the next node" do
        linked_list_with_node.add(value_1)
        linked_list_with_node.first_node.next_node.value.should == value_1
      end
    end
  end

  describe "#find" do
    value = "5678"
    it "returns the given node when given the value" do
      linked_list_with_node.add("5678")
      linked_list_with_node.find(value).should == linked_list_with_node.first_node.next_node
    end
  end

  describe "#delete" do
    it "removes a node from the linked list" do
      linked_list_with_node.add(value_1)
      linked_list_with_node.add(value_2)
      
      node_1 = linked_list_with_node.find(value_1)
      node_2 = linked_list_with_node.find(value_2)
      
      linked_list_with_node.delete(value_1)
      linked_list_with_node.first_node.next_node.should == node_2
    end
  end

end
