require_relative './apollo.pb'

module ApolloFederation
  module Tracing
    Trace = ::Squareup::Mdg::Engine::Proto::Trace
    Node = ::Squareup::Mdg::Engine::Proto::Trace::Node
    Location = ::Squareup::Mdg::Engine::Proto::Trace::Location
    Error = ::Squareup::Mdg::Engine::Proto::Trace::Error
  end
end
