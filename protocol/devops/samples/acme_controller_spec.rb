require "rails_helper"

RSpec.describe AcmeController do
  describe "GET /.well-known/acme-challenge/:token" do
    context "when given a token matching the ACME_TOKEN variable" do
      it "replies with ACME_KEY" do
        key = "some-key"
        token = "some-token"

        ClimateControl.modify ACME_KEY: key, ACME_TOKEN: token do
          get :letsencrypt, params: { token: token }
        end

        expect(response.body).to eq key
      end

      it "does not reply to an invalid token" do
        key = "some-key"
        token = "some-token"

        ClimateControl.modify ACME_KEY: key, ACME_TOKEN: token do
          get :letsencrypt, params: { token: "invalid-token" }
        end

        expect(response.body).to be_empty
      end
    end

    context "when given a token matching the ACME_TOKEN_X variable" do
      it "replies with ACME_KEY_X" do
        key = "some-key"
        token = "some-token"

        ClimateControl.modify ACME_KEY_1: key, ACME_TOKEN_1: tokeQn do
          get :letsencrypt, params: { token: token }
        end

        expect(response.body).to eq key
      end

      it "does not reply to an invalid token" do
        key = "some-key"
        token = "some-token"

        ClimateControl.modify ACME_KEY_1: key, ACME_TOKEN_1: token do
          get :letsencrypt, params: { token: "invalid-token" }
        end

        expect(response.body).to be_empty
      end
    end

    context "when two tokens exist" do
      it "replies with the matching key" do
        key1 = "some-key"
        token1 = "some-token"
        key2 = "some-other-key"
        token2 = "some-other-token"

        ClimateControl.modify ACME_KEY_1: key1, ACME_TOKEN_1: token1, ACME_KEY_2: key2, ACME_TOKEN_2: token2 do
          get :letsencrypt, params: { token: token2 }
        end

        expect(response.body).to eq key2
      end
    end
  end
end

