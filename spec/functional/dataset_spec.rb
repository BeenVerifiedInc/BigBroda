require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Dataset", :vcr => { :allow_unused_http_interactions => true } do

  before(:all) do
     VCR.use_cassette("Dataset/authorize_config") do
      config_setup
      @auth = BigBroda::Auth.new
      @auth.authorize
      @project = config_options["email"].match(/(\d*)/)[0]
    end
  end

  before :each do
    @name = "rspec_schema"
  end

  it ".list", :vcr do
    expect(BigBroda::Dataset.list(@project)["datasets"]).to_not be_empty
  end

  context "operations" do
    after(:each) do
      VCR.use_cassette('delete_each_dataset') do
        BigBroda::Dataset.delete(@project, @name)
      end
    end

    it "create & .delete", :vcr do
      expect(
        BigBroda::Dataset.create(@project,
          {"datasetReference"=> { "datasetId" => @name }} )["id"]
        ).to include @name
    end

    it ".update & delete", :vcr do
      expect(
        BigBroda::Dataset.create(@project,
          {"datasetReference"=> { "datasetId" =>@name }} )["id"]
        ).to include @name

      expect(
        BigBroda::Dataset.update(@project, @name,
          {"datasetReference"=> {
           "datasetId" =>@name },
          "description"=> "foobar"} )["description"]
        ).to include "foobar"
    end

    it ".patch & delete", :vcr do
      expect(
        BigBroda::Dataset.create(@project,
          {"datasetReference"=> { "datasetId" =>@name }} )["id"]
        ).to include @name

      expect(
        BigBroda::Dataset.patch(@project, @name,
          {"datasetReference"=> {
           "datasetId" =>@name },
          "description"=> "foobar"} )["description"]
        ).to include "foobar"
    end

    it ".get & delete", :vcr do
      expect(
        BigBroda::Dataset.create(@project,
          {"datasetReference"=> { "datasetId" =>@name }} )["id"]
      ).to include @name

      expect(
        BigBroda::Dataset.get(@project, @name )["id"]
      ).to include @name
    end
  end


end
