# encoding: utf-8
# frozen_string_literal: true

##
# This file is auto-generated. DO NOT EDIT!
#
require 'base64'
require 'set'
require 'protobuf'


##
# Imports
#
require 'google/protobuf/timestamp.pb'

module Squareup
  module Mdg
    module Engine
      module Proto
        FULLY_QUALIFIED_NAME = 'squareup.mdg.engine.proto' unless defined?(self::FULLY_QUALIFIED_NAME)

        @descriptors = [] unless instance_variable_defined?(:@descriptors)
        @descriptors << lambda do
          bytes = File.read(__FILE__, mode: 'rb').split(/^__END__$/, 2).last
          ::Google::Protobuf::FileDescriptorProto.decode(Base64.decode64(bytes))
        end

        @descriptor_dependencies = Set.new unless instance_variable_defined?(:@descriptor_dependencies)
        @descriptor_dependencies |= [Google::Protobuf]

        unless respond_to?(:descriptor_set)
          def self.descriptor_set
            ::Google::Protobuf::FileDescriptorSet.new(:file => @descriptors.map(&:call))
          end
        end

        unless respond_to?(:descriptor_dependencies)
          def self.descriptor_dependencies
            @descriptor_dependencies
          end
        end
        ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

        ##
        # Message Classes
        #
        class Trace < ::Protobuf::Message
          class CachePolicy < ::Protobuf::Message
            class Scope < ::Protobuf::Enum
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Scope'

              define :UNKNOWN, 0
              define :PUBLIC, 1
              define :PRIVATE, 2
            end

          end

          class Details < ::Protobuf::Message
          end

          class Error < ::Protobuf::Message; end
          class HTTP < ::Protobuf::Message
            class Method < ::Protobuf::Enum
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Method'

              define :UNKNOWN, 0
              define :OPTIONS, 1
              define :GET, 2
              define :HEAD, 3
              define :POST, 4
              define :PUT, 5
              define :DELETE, 6
              define :TRACE, 7
              define :CONNECT, 8
              define :PATCH, 9
            end

            class Values < ::Protobuf::Message; end

          end

          class Location < ::Protobuf::Message; end
          class Node < ::Protobuf::Message; end
          class QueryPlanNode < ::Protobuf::Message
            class SequenceNode < ::Protobuf::Message; end
            class ParallelNode < ::Protobuf::Message; end
            class FetchNode < ::Protobuf::Message; end
            class FlattenNode < ::Protobuf::Message; end
            class ResponsePathElement < ::Protobuf::Message; end

          end


        end

        class ReportHeader < ::Protobuf::Message; end
        class PathErrorStats < ::Protobuf::Message
        end

        class QueryLatencyStats < ::Protobuf::Message; end
        class StatsContext < ::Protobuf::Message; end
        class ContextualizedQueryLatencyStats < ::Protobuf::Message; end
        class ContextualizedTypeStats < ::Protobuf::Message
        end

        class FieldStat < ::Protobuf::Message; end
        class TypeStat < ::Protobuf::Message
        end

        class Field < ::Protobuf::Message; end
        class Type < ::Protobuf::Message; end
        class Report < ::Protobuf::Message
        end

        class ContextualizedStats < ::Protobuf::Message
        end

        class TracesAndStats < ::Protobuf::Message; end


        ##
        # Message Fields
        #
        class Trace
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Trace'
          class CachePolicy
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.CachePolicy'
            optional ::Squareup::Mdg::Engine::Proto::Trace::CachePolicy::Scope, :scope, 1
            optional :int64, :max_age_ns, 2
          end

          class Details
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Details'
            map :string, :string, :variables_json, 4
            map :string, :bytes, :deprecated_variables, 1
            optional :string, :operation_name, 3
          end

          class Error
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Error'
            optional :string, :message, 1
            repeated ::Squareup::Mdg::Engine::Proto::Trace::Location, :location, 2
            optional :uint64, :time_ns, 3
            optional :string, :json, 4
          end

          class HTTP
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.HTTP'
            class Values
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Values'
              repeated :string, :value, 1
            end

            optional ::Squareup::Mdg::Engine::Proto::Trace::HTTP::Method, :method, 1
            optional :string, :host, 2
            optional :string, :path, 3
            map :string, ::Squareup::Mdg::Engine::Proto::Trace::HTTP::Values, :request_headers, 4
            map :string, ::Squareup::Mdg::Engine::Proto::Trace::HTTP::Values, :response_headers, 5
            optional :uint32, :status_code, 6
            optional :bool, :secure, 8
            optional :string, :protocol, 9
          end

          class Location
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Location'
            optional :uint32, :line, 1
            optional :uint32, :column, 2
          end

          class Node
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Node'
            optional :string, :response_name, 1
            optional :uint32, :index, 2
            optional :string, :original_field_name, 14
            optional :string, :type, 3
            optional :string, :parent_type, 13
            optional ::Squareup::Mdg::Engine::Proto::Trace::CachePolicy, :cache_policy, 5
            optional :uint64, :start_time, 8
            optional :uint64, :end_time, 9
            repeated ::Squareup::Mdg::Engine::Proto::Trace::Error, :error, 11
            repeated ::Squareup::Mdg::Engine::Proto::Trace::Node, :child, 12
          end

          class QueryPlanNode
            FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.QueryPlanNode'
            class SequenceNode
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.SequenceNode'
              repeated ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode, :nodes, 1
            end

            class ParallelNode
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.ParallelNode'
              repeated ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode, :nodes, 1
            end

            class FetchNode
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.FetchNode'
              optional :string, :service_name, 1
              optional :bool, :trace_parsing_failed, 2
              optional ::Squareup::Mdg::Engine::Proto::Trace, :trace, 3
              optional :uint64, :sent_time_offset, 4
              optional ::Google::Protobuf::Timestamp, :sent_time, 5
              optional ::Google::Protobuf::Timestamp, :received_time, 6
            end

            class FlattenNode
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.FlattenNode'
              repeated ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode::ResponsePathElement, :response_path, 1
              optional ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode, :node, 2
            end

            class ResponsePathElement
              FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.ResponsePathElement'
              optional :string, :field_name, 1
              optional :uint32, :index, 2
            end

            optional ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode::SequenceNode, :sequence, 1
            optional ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode::ParallelNode, :parallel, 2
            optional ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode::FetchNode, :fetch, 3
            optional ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode::FlattenNode, :flatten, 4
          end

          optional ::Google::Protobuf::Timestamp, :start_time, 4
          optional ::Google::Protobuf::Timestamp, :end_time, 3
          optional :uint64, :duration_ns, 11
          optional ::Squareup::Mdg::Engine::Proto::Trace::Node, :root, 14
          optional :string, :signature, 19
          optional ::Squareup::Mdg::Engine::Proto::Trace::Details, :details, 6
          optional :string, :client_name, 7
          optional :string, :client_version, 8
          optional :string, :client_address, 9
          optional :string, :client_reference_id, 23
          optional ::Squareup::Mdg::Engine::Proto::Trace::HTTP, :http, 10
          optional ::Squareup::Mdg::Engine::Proto::Trace::CachePolicy, :cache_policy, 18
          optional ::Squareup::Mdg::Engine::Proto::Trace::QueryPlanNode, :query_plan, 26
          optional :bool, :full_query_cache_hit, 20
          optional :bool, :persisted_query_hit, 21
          optional :bool, :persisted_query_register, 22
          optional :bool, :registered_operation, 24
          optional :bool, :forbidden_operation, 25
          optional :string, :legacy_signature_needs_resigning, 5
        end

        class ReportHeader
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.ReportHeader'
          optional :string, :hostname, 5
          optional :string, :agent_version, 6
          optional :string, :service_version, 7
          optional :string, :runtime_version, 8
          optional :string, :uname, 9
          optional :string, :schema_tag, 10
          optional :string, :executable_schema_id, 11
        end

        class PathErrorStats
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.PathErrorStats'
          map :string, ::Squareup::Mdg::Engine::Proto::PathErrorStats, :children, 1
          optional :uint64, :errors_count, 4
          optional :uint64, :requests_with_errors_count, 5
        end

        class QueryLatencyStats
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.QueryLatencyStats'
          repeated :int64, :latency_count, 1
          optional :uint64, :request_count, 2
          optional :uint64, :cache_hits, 3
          optional :uint64, :persisted_query_hits, 4
          optional :uint64, :persisted_query_misses, 5
          repeated :int64, :cache_latency_count, 6
          optional ::Squareup::Mdg::Engine::Proto::PathErrorStats, :root_error_stats, 7
          optional :uint64, :requests_with_errors_count, 8
          repeated :int64, :public_cache_ttl_count, 9
          repeated :int64, :private_cache_ttl_count, 10
          optional :uint64, :registered_operation_count, 11
          optional :uint64, :forbidden_operation_count, 12
        end

        class StatsContext
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.StatsContext'
          optional :string, :client_reference_id, 1
          optional :string, :client_name, 2
          optional :string, :client_version, 3
        end

        class ContextualizedQueryLatencyStats
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.ContextualizedQueryLatencyStats'
          optional ::Squareup::Mdg::Engine::Proto::QueryLatencyStats, :query_latency_stats, 1
          optional ::Squareup::Mdg::Engine::Proto::StatsContext, :context, 2
        end

        class ContextualizedTypeStats
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.ContextualizedTypeStats'
          optional ::Squareup::Mdg::Engine::Proto::StatsContext, :context, 1
          map :string, ::Squareup::Mdg::Engine::Proto::TypeStat, :per_type_stat, 2
        end

        class FieldStat
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.FieldStat'
          optional :string, :return_type, 3
          optional :uint64, :errors_count, 4
          optional :uint64, :count, 5
          optional :uint64, :requests_with_errors_count, 6
          repeated :int64, :latency_count, 8
        end

        class TypeStat
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.TypeStat'
          map :string, ::Squareup::Mdg::Engine::Proto::FieldStat, :per_field_stat, 3
        end

        class Field
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Field'
          optional :string, :name, 2
          optional :string, :return_type, 3
        end

        class Type
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Type'
          optional :string, :name, 1
          repeated ::Squareup::Mdg::Engine::Proto::Field, :field, 2
        end

        class Report
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.Report'
          optional ::Squareup::Mdg::Engine::Proto::ReportHeader, :header, 1
          map :string, ::Squareup::Mdg::Engine::Proto::TracesAndStats, :traces_per_query, 5
          optional ::Google::Protobuf::Timestamp, :end_time, 2
        end

        class ContextualizedStats
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.ContextualizedStats'
          optional ::Squareup::Mdg::Engine::Proto::StatsContext, :context, 1
          optional ::Squareup::Mdg::Engine::Proto::QueryLatencyStats, :query_latency_stats, 2
          map :string, ::Squareup::Mdg::Engine::Proto::TypeStat, :per_type_stat, 3
        end

        class TracesAndStats
          FULLY_QUALIFIED_NAME = FULLY_QUALIFIED_NAME + '.TracesAndStats'
          repeated ::Squareup::Mdg::Engine::Proto::Trace, :trace, 1
          repeated ::Squareup::Mdg::Engine::Proto::ContextualizedStats, :stats_with_context, 2
        end

      end

    end

  end

end


# Raw descriptor bytes below
__END__
ChVzcXVhcmV1cC9hcG9sbG8ucHJvdG8SGXNxdWFyZXVwLm1kZy5lbmdpbmUu
cHJvdG8aH2dvb2dsZS9wcm90b2J1Zi90aW1lc3RhbXAucHJvdG8i6SAKBVRy
YWNlEjkKCnN0YXJ0X3RpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt
ZXN0YW1wUglzdGFydFRpbWUSNQoIZW5kX3RpbWUYAyABKAsyGi5nb29nbGUu
cHJvdG9idWYuVGltZXN0YW1wUgdlbmRUaW1lEh8KC2R1cmF0aW9uX25zGAsg
ASgEUgpkdXJhdGlvbk5zEjkKBHJvb3QYDiABKAsyJS5zcXVhcmV1cC5tZGcu
ZW5naW5lLnByb3RvLlRyYWNlLk5vZGVSBHJvb3QSHAoJc2lnbmF0dXJlGBMg
ASgJUglzaWduYXR1cmUSQgoHZGV0YWlscxgGIAEoCzIoLnNxdWFyZXVwLm1k
Zy5lbmdpbmUucHJvdG8uVHJhY2UuRGV0YWlsc1IHZGV0YWlscxIfCgtjbGll
bnRfbmFtZRgHIAEoCVIKY2xpZW50TmFtZRIlCg5jbGllbnRfdmVyc2lvbhgI
IAEoCVINY2xpZW50VmVyc2lvbhIlCg5jbGllbnRfYWRkcmVzcxgJIAEoCVIN
Y2xpZW50QWRkcmVzcxIuChNjbGllbnRfcmVmZXJlbmNlX2lkGBcgASgJUhFj
bGllbnRSZWZlcmVuY2VJZBI5CgRodHRwGAogASgLMiUuc3F1YXJldXAubWRn
LmVuZ2luZS5wcm90by5UcmFjZS5IVFRQUgRodHRwEk8KDGNhY2hlX3BvbGlj
eRgSIAEoCzIsLnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2UuQ2Fj
aGVQb2xpY3lSC2NhY2hlUG9saWN5Ek0KCnF1ZXJ5X3BsYW4YGiABKAsyLi5z
cXVhcmV1cC5tZGcuZW5naW5lLnByb3RvLlRyYWNlLlF1ZXJ5UGxhbk5vZGVS
CXF1ZXJ5UGxhbhIvChRmdWxsX3F1ZXJ5X2NhY2hlX2hpdBgUIAEoCFIRZnVs
bFF1ZXJ5Q2FjaGVIaXQSLgoTcGVyc2lzdGVkX3F1ZXJ5X2hpdBgVIAEoCFIR
cGVyc2lzdGVkUXVlcnlIaXQSOAoYcGVyc2lzdGVkX3F1ZXJ5X3JlZ2lzdGVy
GBYgASgIUhZwZXJzaXN0ZWRRdWVyeVJlZ2lzdGVyEjEKFHJlZ2lzdGVyZWRf
b3BlcmF0aW9uGBggASgIUhNyZWdpc3RlcmVkT3BlcmF0aW9uEi8KE2ZvcmJp
ZGRlbl9vcGVyYXRpb24YGSABKAhSEmZvcmJpZGRlbk9wZXJhdGlvbhJHCiBs
ZWdhY3lfc2lnbmF0dXJlX25lZWRzX3Jlc2lnbmluZxgFIAEoCVIdbGVnYWN5
U2lnbmF0dXJlTmVlZHNSZXNpZ25pbmcapAEKC0NhY2hlUG9saWN5EkgKBXNj
b3BlGAEgASgOMjIuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5UcmFjZS5D
YWNoZVBvbGljeS5TY29wZVIFc2NvcGUSHAoKbWF4X2FnZV9ucxgCIAEoA1II
bWF4QWdlTnMiLQoFU2NvcGUSCwoHVU5LTk9XThAAEgoKBlBVQkxJQxABEgsK
B1BSSVZBVEUQAhqUAwoHRGV0YWlscxJiCg52YXJpYWJsZXNfanNvbhgEIAMo
CzI7LnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2UuRGV0YWlscy5W
YXJpYWJsZXNKc29uRW50cnlSDXZhcmlhYmxlc0pzb24SdAoUZGVwcmVjYXRl
ZF92YXJpYWJsZXMYASADKAsyQS5zcXVhcmV1cC5tZGcuZW5naW5lLnByb3Rv
LlRyYWNlLkRldGFpbHMuRGVwcmVjYXRlZFZhcmlhYmxlc0VudHJ5UhNkZXBy
ZWNhdGVkVmFyaWFibGVzEiUKDm9wZXJhdGlvbl9uYW1lGAMgASgJUg1vcGVy
YXRpb25OYW1lGkAKElZhcmlhYmxlc0pzb25FbnRyeRIQCgNrZXkYASABKAlS
A2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGkYKGERlcHJlY2F0ZWRW
YXJpYWJsZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEo
DFIFdmFsdWU6AjgBGpUBCgVFcnJvchIYCgdtZXNzYWdlGAEgASgJUgdtZXNz
YWdlEkUKCGxvY2F0aW9uGAIgAygLMikuc3F1YXJldXAubWRnLmVuZ2luZS5w
cm90by5UcmFjZS5Mb2NhdGlvblIIbG9jYXRpb24SFwoHdGltZV9ucxgDIAEo
BFIGdGltZU5zEhIKBGpzb24YBCABKAlSBGpzb24akAYKBEhUVFASRAoGbWV0
aG9kGAEgASgOMiwuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5UcmFjZS5I
VFRQLk1ldGhvZFIGbWV0aG9kEhIKBGhvc3QYAiABKAlSBGhvc3QSEgoEcGF0
aBgDIAEoCVIEcGF0aBJiCg9yZXF1ZXN0X2hlYWRlcnMYBCADKAsyOS5zcXVh
cmV1cC5tZGcuZW5naW5lLnByb3RvLlRyYWNlLkhUVFAuUmVxdWVzdEhlYWRl
cnNFbnRyeVIOcmVxdWVzdEhlYWRlcnMSZQoQcmVzcG9uc2VfaGVhZGVycxgF
IAMoCzI6LnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2UuSFRUUC5S
ZXNwb25zZUhlYWRlcnNFbnRyeVIPcmVzcG9uc2VIZWFkZXJzEh8KC3N0YXR1
c19jb2RlGAYgASgNUgpzdGF0dXNDb2RlEhYKBnNlY3VyZRgIIAEoCFIGc2Vj
dXJlEhoKCHByb3RvY29sGAkgASgJUghwcm90b2NvbBoeCgZWYWx1ZXMSFAoF
dmFsdWUYASADKAlSBXZhbHVlGm8KE1JlcXVlc3RIZWFkZXJzRW50cnkSEAoD
a2V5GAEgASgJUgNrZXkSQgoFdmFsdWUYAiABKAsyLC5zcXVhcmV1cC5tZGcu
ZW5naW5lLnByb3RvLlRyYWNlLkhUVFAuVmFsdWVzUgV2YWx1ZToCOAEacAoU
UmVzcG9uc2VIZWFkZXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSQgoFdmFs
dWUYAiABKAsyLC5zcXVhcmV1cC5tZGcuZW5naW5lLnByb3RvLlRyYWNlLkhU
VFAuVmFsdWVzUgV2YWx1ZToCOAEidwoGTWV0aG9kEgsKB1VOS05PV04QABIL
CgdPUFRJT05TEAESBwoDR0VUEAISCAoESEVBRBADEggKBFBPU1QQBBIHCgNQ
VVQQBRIKCgZERUxFVEUQBhIJCgVUUkFDRRAHEgsKB0NPTk5FQ1QQCBIJCgVQ
QVRDSBAJGjYKCExvY2F0aW9uEhIKBGxpbmUYASABKA1SBGxpbmUSFgoGY29s
dW1uGAIgASgNUgZjb2x1bW4avAMKBE5vZGUSJQoNcmVzcG9uc2VfbmFtZRgB
IAEoCUgAUgxyZXNwb25zZU5hbWUSFgoFaW5kZXgYAiABKA1IAFIFaW5kZXgS
LgoTb3JpZ2luYWxfZmllbGRfbmFtZRgOIAEoCVIRb3JpZ2luYWxGaWVsZE5h
bWUSEgoEdHlwZRgDIAEoCVIEdHlwZRIfCgtwYXJlbnRfdHlwZRgNIAEoCVIK
cGFyZW50VHlwZRJPCgxjYWNoZV9wb2xpY3kYBSABKAsyLC5zcXVhcmV1cC5t
ZGcuZW5naW5lLnByb3RvLlRyYWNlLkNhY2hlUG9saWN5UgtjYWNoZVBvbGlj
eRIdCgpzdGFydF90aW1lGAggASgEUglzdGFydFRpbWUSGQoIZW5kX3RpbWUY
CSABKARSB2VuZFRpbWUSPAoFZXJyb3IYCyADKAsyJi5zcXVhcmV1cC5tZGcu
ZW5naW5lLnByb3RvLlRyYWNlLkVycm9yUgVlcnJvchI7CgVjaGlsZBgMIAMo
CzIlLnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2UuTm9kZVIFY2hp
bGRCBAoCaWRKBAgEEAUa9QgKDVF1ZXJ5UGxhbk5vZGUSWQoIc2VxdWVuY2UY
ASABKAsyOy5zcXVhcmV1cC5tZGcuZW5naW5lLnByb3RvLlRyYWNlLlF1ZXJ5
UGxhbk5vZGUuU2VxdWVuY2VOb2RlSABSCHNlcXVlbmNlElkKCHBhcmFsbGVs
GAIgASgLMjsuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5UcmFjZS5RdWVy
eVBsYW5Ob2RlLlBhcmFsbGVsTm9kZUgAUghwYXJhbGxlbBJQCgVmZXRjaBgD
IAEoCzI4LnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2UuUXVlcnlQ
bGFuTm9kZS5GZXRjaE5vZGVIAFIFZmV0Y2gSVgoHZmxhdHRlbhgEIAEoCzI6
LnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2UuUXVlcnlQbGFuTm9k
ZS5GbGF0dGVuTm9kZUgAUgdmbGF0dGVuGlQKDFNlcXVlbmNlTm9kZRJECgVu
b2RlcxgBIAMoCzIuLnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2Uu
UXVlcnlQbGFuTm9kZVIFbm9kZXMaVAoMUGFyYWxsZWxOb2RlEkQKBW5vZGVz
GAEgAygLMi4uc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5UcmFjZS5RdWVy
eVBsYW5Ob2RlUgVub2Rlcxq8AgoJRmV0Y2hOb2RlEiEKDHNlcnZpY2VfbmFt
ZRgBIAEoCVILc2VydmljZU5hbWUSMAoUdHJhY2VfcGFyc2luZ19mYWlsZWQY
AiABKAhSEnRyYWNlUGFyc2luZ0ZhaWxlZBI2CgV0cmFjZRgDIAEoCzIgLnNx
dWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uVHJhY2VSBXRyYWNlEigKEHNlbnRf
dGltZV9vZmZzZXQYBCABKARSDnNlbnRUaW1lT2Zmc2V0EjcKCXNlbnRfdGlt
ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCHNlbnRUaW1l
Ej8KDXJlY2VpdmVkX3RpbWUYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt
ZXN0YW1wUgxyZWNlaXZlZFRpbWUaugEKC0ZsYXR0ZW5Ob2RlEmcKDXJlc3Bv
bnNlX3BhdGgYASADKAsyQi5zcXVhcmV1cC5tZGcuZW5naW5lLnByb3RvLlRy
YWNlLlF1ZXJ5UGxhbk5vZGUuUmVzcG9uc2VQYXRoRWxlbWVudFIMcmVzcG9u
c2VQYXRoEkIKBG5vZGUYAiABKAsyLi5zcXVhcmV1cC5tZGcuZW5naW5lLnBy
b3RvLlRyYWNlLlF1ZXJ5UGxhbk5vZGVSBG5vZGUaVAoTUmVzcG9uc2VQYXRo
RWxlbWVudBIfCgpmaWVsZF9uYW1lGAEgASgJSABSCWZpZWxkTmFtZRIWCgVp
bmRleBgCIAEoDUgAUgVpbmRleEIECgJpZEIGCgRub2RlSgQIDBANSgQIDRAO
SgQIARACSgQIAhADIo4CCgxSZXBvcnRIZWFkZXISGgoIaG9zdG5hbWUYBSAB
KAlSCGhvc3RuYW1lEiMKDWFnZW50X3ZlcnNpb24YBiABKAlSDGFnZW50VmVy
c2lvbhInCg9zZXJ2aWNlX3ZlcnNpb24YByABKAlSDnNlcnZpY2VWZXJzaW9u
EicKD3J1bnRpbWVfdmVyc2lvbhgIIAEoCVIOcnVudGltZVZlcnNpb24SFAoF
dW5hbWUYCSABKAlSBXVuYW1lEh0KCnNjaGVtYV90YWcYCiABKAlSCXNjaGVt
YVRhZxIwChRleGVjdXRhYmxlX3NjaGVtYV9pZBgLIAEoCVISZXhlY3V0YWJs
ZVNjaGVtYUlkSgQIAxAEIq0CCg5QYXRoRXJyb3JTdGF0cxJTCghjaGlsZHJl
bhgBIAMoCzI3LnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uUGF0aEVycm9y
U3RhdHMuQ2hpbGRyZW5FbnRyeVIIY2hpbGRyZW4SIQoMZXJyb3JzX2NvdW50
GAQgASgEUgtlcnJvcnNDb3VudBI7ChpyZXF1ZXN0c193aXRoX2Vycm9yc19j
b3VudBgFIAEoBFIXcmVxdWVzdHNXaXRoRXJyb3JzQ291bnQaZgoNQ2hpbGRy
ZW5FbnRyeRIQCgNrZXkYASABKAlSA2tleRI/CgV2YWx1ZRgCIAEoCzIpLnNx
dWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uUGF0aEVycm9yU3RhdHNSBXZhbHVl
OgI4ASKMBQoRUXVlcnlMYXRlbmN5U3RhdHMSIwoNbGF0ZW5jeV9jb3VudBgB
IAMoA1IMbGF0ZW5jeUNvdW50EiMKDXJlcXVlc3RfY291bnQYAiABKARSDHJl
cXVlc3RDb3VudBIdCgpjYWNoZV9oaXRzGAMgASgEUgljYWNoZUhpdHMSMAoU
cGVyc2lzdGVkX3F1ZXJ5X2hpdHMYBCABKARSEnBlcnNpc3RlZFF1ZXJ5SGl0
cxI0ChZwZXJzaXN0ZWRfcXVlcnlfbWlzc2VzGAUgASgEUhRwZXJzaXN0ZWRR
dWVyeU1pc3NlcxIuChNjYWNoZV9sYXRlbmN5X2NvdW50GAYgAygDUhFjYWNo
ZUxhdGVuY3lDb3VudBJTChByb290X2Vycm9yX3N0YXRzGAcgASgLMikuc3F1
YXJldXAubWRnLmVuZ2luZS5wcm90by5QYXRoRXJyb3JTdGF0c1IOcm9vdEVy
cm9yU3RhdHMSOwoacmVxdWVzdHNfd2l0aF9lcnJvcnNfY291bnQYCCABKARS
F3JlcXVlc3RzV2l0aEVycm9yc0NvdW50EjMKFnB1YmxpY19jYWNoZV90dGxf
Y291bnQYCSADKANSE3B1YmxpY0NhY2hlVHRsQ291bnQSNQoXcHJpdmF0ZV9j
YWNoZV90dGxfY291bnQYCiADKANSFHByaXZhdGVDYWNoZVR0bENvdW50EjwK
GnJlZ2lzdGVyZWRfb3BlcmF0aW9uX2NvdW50GAsgASgEUhhyZWdpc3RlcmVk
T3BlcmF0aW9uQ291bnQSOgoZZm9yYmlkZGVuX29wZXJhdGlvbl9jb3VudBgM
IAEoBFIXZm9yYmlkZGVuT3BlcmF0aW9uQ291bnQihgEKDFN0YXRzQ29udGV4
dBIuChNjbGllbnRfcmVmZXJlbmNlX2lkGAEgASgJUhFjbGllbnRSZWZlcmVu
Y2VJZBIfCgtjbGllbnRfbmFtZRgCIAEoCVIKY2xpZW50TmFtZRIlCg5jbGll
bnRfdmVyc2lvbhgDIAEoCVINY2xpZW50VmVyc2lvbiLCAQofQ29udGV4dHVh
bGl6ZWRRdWVyeUxhdGVuY3lTdGF0cxJcChNxdWVyeV9sYXRlbmN5X3N0YXRz
GAEgASgLMiwuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5RdWVyeUxhdGVu
Y3lTdGF0c1IRcXVlcnlMYXRlbmN5U3RhdHMSQQoHY29udGV4dBgCIAEoCzIn
LnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uU3RhdHNDb250ZXh0Ugdjb250
ZXh0IqoCChdDb250ZXh0dWFsaXplZFR5cGVTdGF0cxJBCgdjb250ZXh0GAEg
ASgLMicuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5TdGF0c0NvbnRleHRS
B2NvbnRleHQSZwoNcGVyX3R5cGVfc3RhdBgCIAMoCzJDLnNxdWFyZXVwLm1k
Zy5lbmdpbmUucHJvdG8uQ29udGV4dHVhbGl6ZWRUeXBlU3RhdHMuUGVyVHlw
ZVN0YXRFbnRyeVILcGVyVHlwZVN0YXQaYwoQUGVyVHlwZVN0YXRFbnRyeRIQ
CgNrZXkYASABKAlSA2tleRI5CgV2YWx1ZRgCIAEoCzIjLnNxdWFyZXVwLm1k
Zy5lbmdpbmUucHJvdG8uVHlwZVN0YXRSBXZhbHVlOgI4ASLZAQoJRmllbGRT
dGF0Eh8KC3JldHVybl90eXBlGAMgASgJUgpyZXR1cm5UeXBlEiEKDGVycm9y
c19jb3VudBgEIAEoBFILZXJyb3JzQ291bnQSFAoFY291bnQYBSABKARSBWNv
dW50EjsKGnJlcXVlc3RzX3dpdGhfZXJyb3JzX2NvdW50GAYgASgEUhdyZXF1
ZXN0c1dpdGhFcnJvcnNDb3VudBIjCg1sYXRlbmN5X2NvdW50GAggAygDUgxs
YXRlbmN5Q291bnRKBAgBEAJKBAgCEANKBAgHEAgi2gEKCFR5cGVTdGF0ElsK
DnBlcl9maWVsZF9zdGF0GAMgAygLMjUuc3F1YXJldXAubWRnLmVuZ2luZS5w
cm90by5UeXBlU3RhdC5QZXJGaWVsZFN0YXRFbnRyeVIMcGVyRmllbGRTdGF0
GmUKEVBlckZpZWxkU3RhdEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EjoKBXZh
bHVlGAIgASgLMiQuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5GaWVsZFN0
YXRSBXZhbHVlOgI4AUoECAEQAkoECAIQAyI8CgVGaWVsZBISCgRuYW1lGAIg
ASgJUgRuYW1lEh8KC3JldHVybl90eXBlGAMgASgJUgpyZXR1cm5UeXBlIlIK
BFR5cGUSEgoEbmFtZRgBIAEoCVIEbmFtZRI2CgVmaWVsZBgCIAMoCzIgLnNx
dWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uRmllbGRSBWZpZWxkIs8CCgZSZXBv
cnQSPwoGaGVhZGVyGAEgASgLMicuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90
by5SZXBvcnRIZWFkZXJSBmhlYWRlchJfChB0cmFjZXNfcGVyX3F1ZXJ5GAUg
AygLMjUuc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5SZXBvcnQuVHJhY2Vz
UGVyUXVlcnlFbnRyeVIOdHJhY2VzUGVyUXVlcnkSNQoIZW5kX3RpbWUYAiAB
KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdlbmRUaW1lGmwKE1Ry
YWNlc1BlclF1ZXJ5RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSPwoFdmFsdWUY
AiABKAsyKS5zcXVhcmV1cC5tZGcuZW5naW5lLnByb3RvLlRyYWNlc0FuZFN0
YXRzUgV2YWx1ZToCOAEigAMKE0NvbnRleHR1YWxpemVkU3RhdHMSQQoHY29u
dGV4dBgBIAEoCzInLnNxdWFyZXVwLm1kZy5lbmdpbmUucHJvdG8uU3RhdHND
b250ZXh0Ugdjb250ZXh0ElwKE3F1ZXJ5X2xhdGVuY3lfc3RhdHMYAiABKAsy
LC5zcXVhcmV1cC5tZGcuZW5naW5lLnByb3RvLlF1ZXJ5TGF0ZW5jeVN0YXRz
UhFxdWVyeUxhdGVuY3lTdGF0cxJjCg1wZXJfdHlwZV9zdGF0GAMgAygLMj8u
c3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5Db250ZXh0dWFsaXplZFN0YXRz
LlBlclR5cGVTdGF0RW50cnlSC3BlclR5cGVTdGF0GmMKEFBlclR5cGVTdGF0
RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSOQoFdmFsdWUYAiABKAsyIy5zcXVh
cmV1cC5tZGcuZW5naW5lLnByb3RvLlR5cGVTdGF0UgV2YWx1ZToCOAEipgEK
DlRyYWNlc0FuZFN0YXRzEjYKBXRyYWNlGAEgAygLMiAuc3F1YXJldXAubWRn
LmVuZ2luZS5wcm90by5UcmFjZVIFdHJhY2USXAoSc3RhdHNfd2l0aF9jb250
ZXh0GAIgAygLMi4uc3F1YXJldXAubWRnLmVuZ2luZS5wcm90by5Db250ZXh0
dWFsaXplZFN0YXRzUhBzdGF0c1dpdGhDb250ZXh0SsebAQoHEgUAAPwCAQoI
CgEMEgMAABIKCAoBAhIDAgghCgkKAgMAEgMEBygKCwoCBAASBQYA+AEBCgoK
AwQAARIDBggNCgwKBAQAAwASBAcIEAkKDAoFBAADAAESAwcQGwoOCgYEAAMA
BAASBAgQDBEKDgoHBAADAAQAARIDCBUaCg8KCAQAAwAEAAIAEgMJGCQKEAoJ
BAADAAQAAgABEgMJGB8KEAoJBAADAAQAAgACEgMJIiMKDwoIBAADAAQAAgES
AwoYIwoQCgkEAAMABAACAQESAwoYHgoQCgkEAAMABAACAQISAwohIgoPCggE
AAMABAACAhIDCxgkChAKCQQAAwAEAAICARIDCxgfChAKCQQAAwAEAAICAhID
CyIjCg0KBgQAAwACABIDDhAgCg8KBwQAAwACAAQSBA4QDBEKDgoHBAADAAIA
BhIDDhAVCg4KBwQAAwACAAESAw4WGwoOCgcEAAMAAgADEgMOHh8KKwoGBAAD
AAIBEgMPECUiHCB1c2UgMCBmb3IgYWJzZW50LCAtMSBmb3IgMAoKDwoHBAAD
AAIBBBIEDxAOIAoOCgcEAAMAAgEFEgMPEBUKDgoHBAADAAIBARIDDxYgCg4K
BwQAAwACAQMSAw8jJAoMCgQEAAMBEgQSCB8JCgwKBQQAAwEBEgMSEBcK+QEK
BgQAAwECABIDFxA3GukBIFRoZSB2YXJpYWJsZXMgYXNzb2NpYXRlZCB3aXRo
IHRoaXMgcXVlcnkgKHVubGVzcyB0aGUgcmVwb3J0aW5nIGFnZW50IGlzCiBj
b25maWd1cmVkIHRvIGtlZXAgdGhlbSBhbGwgcHJpdmF0ZSkuIFZhbHVlcyBh
cmUgSlNPTjogaWUsIHN0cmluZ3MgYXJlCiBlbmNsb3NlZCBpbiBkb3VibGUg
cXVvdGVzLCBldGMuICBUaGUgdmFsdWUgb2YgYSBwcml2YXRlIHZhcmlhYmxl
IGlzCiB0aGUgZW1wdHkgc3RyaW5nLgoKDwoHBAADAQIABBIEFxASGQoOCgcE
AAMBAgAGEgMXECMKDgoHBAADAQIAARIDFyQyCg4KBwQAAwECAAMSAxc1Ngqi
AQoGBAADAQIBEgMaEDwakgEgRGVwcmVjYXRlZC4gRW5naW5lcHJveHkgZGlk
IG5vdCBlbmNvZGUgdmFyaWFibGUgdmFsdWVzIGFzIEpTT04sIHNvIHlvdQog
Y291bGRuJ3QgdGVsbCBudW1iZXJzIGZyb20gbnVtZXJpYyBzdHJpbmdzLiBT
ZW5kIHZhcmlhYmxlc19qc29uIGluc3RlYWQuCgoPCgcEAAMBAgEEEgQaEBc3
Cg4KBwQAAwECAQYSAxoQIgoOCgcEAAMBAgEBEgMaIzcKDgoHBAADAQIBAxID
Gjo7CtgBCgYEAAMBAgISAx4QKhrIASBUaGlzIGlzIGRlcHJlY2F0ZWQgYW5k
IG9ubHkgdXNlZCBmb3IgbGVnYWN5IGFwcGxpY2F0aW9ucwogZG9uJ3QgaW5j
bHVkZSB0aGlzIGluIHRyYWNlcyBpbnNpZGUgYSBGdWxsVHJhY2VzUmVwb3J0
OyB0aGUgb3BlcmF0aW9uCiBuYW1lIGZvciB0aGVzZSB0cmFjZXMgY29tZXMg
ZnJvbSB0aGUga2V5IG9mIHRoZSB0cmFjZXNfcGVyX3F1ZXJ5IG1hcC4KCg8K
BwQAAwECAgQSBB4QGjwKDgoHBAADAQICBRIDHhAWCg4KBwQAAwECAgESAx4X
JQoOCgcEAAMBAgIDEgMeKCkKDAoEBAADAhIEIQgmCQoMCgUEAAMCARIDIRAV
ChkKBgQAAwICABIDIhAjIgogcmVxdWlyZWQKCg8KBwQAAwICAAQSBCIQIRcK
DgoHBAADAgIABRIDIhAWCg4KBwQAAwICAAESAyIXHgoOCgcEAAMCAgADEgMi
ISIKDQoGBAADAgIBEgMjEC8KDgoHBAADAgIBBBIDIxAYCg4KBwQAAwICAQYS
AyMZIQoOCgcEAAMCAgEBEgMjIioKDgoHBAADAgIBAxIDIy0uCg0KBgQAAwIC
AhIDJBAjCg8KBwQAAwICAgQSBCQQIy8KDgoHBAADAgICBRIDJBAWCg4KBwQA
AwICAgESAyQXHgoOCgcEAAMCAgIDEgMkISIKDQoGBAADAgIDEgMlECAKDwoH
BAADAgIDBBIEJRAkIwoOCgcEAAMCAgMFEgMlEBYKDgoHBAADAgIDARIDJRcb
Cg4KBwQAAwICAwMSAyUeHwoMCgQEAAMDEgQoCEUJCgwKBQQAAwMBEgMoEBQK
DgoGBAADAwMAEgQpECsRCg4KBwQAAwMDAAESAykYHgoPCggEAAMDAwACABID
KhgyChAKCQQAAwMDAAIABBIDKhggChAKCQQAAwMDAAIABRIDKiEnChAKCQQA
AwMDAAIAARIDKigtChAKCQQAAwMDAAIAAxIDKjAxCg4KBgQAAwMEABIELRA4
EQoOCgcEAAMDBAABEgMtFRsKDwoIBAADAwQAAgASAy4YJAoQCgkEAAMDBAAC
AAESAy4YHwoQCgkEAAMDBAACAAISAy4iIwoPCggEAAMDBAACARIDLxgkChAK
CQQAAwMEAAIBARIDLxgfChAKCQQAAwMEAAIBAhIDLyIjCg8KCAQAAwMEAAIC
EgMwGCAKEAoJBAADAwQAAgIBEgMwGBsKEAoJBAADAwQAAgICEgMwHh8KDwoI
BAADAwQAAgMSAzEYIQoQCgkEAAMDBAACAwESAzEYHAoQCgkEAAMDBAACAwIS
AzEfIAoPCggEAAMDBAACBBIDMhghChAKCQQAAwMEAAIEARIDMhgcChAKCQQA
AwMEAAIEAhIDMh8gCg8KCAQAAwMEAAIFEgMzGCAKEAoJBAADAwQAAgUBEgMz
GBsKEAoJBAADAwQAAgUCEgMzHh8KDwoIBAADAwQAAgYSAzQYIwoQCgkEAAMD
BAACBgESAzQYHgoQCgkEAAMDBAACBgISAzQhIgoPCggEAAMDBAACBxIDNRgi
ChAKCQQAAwMEAAIHARIDNRgdChAKCQQAAwMEAAIHAhIDNSAhCg8KCAQAAwME
AAIIEgM2GCQKEAoJBAADAwQAAggBEgM2GB8KEAoJBAADAwQAAggCEgM2IiMK
DwoIBAADAwQAAgkSAzcYIgoQCgkEAAMDBAACCQESAzcYHQoQCgkEAAMDBAAC
CQISAzcgIQoNCgYEAAMDAgASAzkQIgoPCgcEAAMDAgAEEgQ5EDgRCg4KBwQA
AwMCAAYSAzkQFgoOCgcEAAMDAgABEgM5Fx0KDgoHBAADAwIAAxIDOSAhCg0K
BgQAAwMCARIDOhAgCg8KBwQAAwMCAQQSBDoQOSIKDgoHBAADAwIBBRIDOhAW
Cg4KBwQAAwMCAQESAzoXGwoOCgcEAAMDAgEDEgM6Hh8KDQoGBAADAwICEgM7
ECAKDwoHBAADAwICBBIEOxA6IAoOCgcEAAMDAgIFEgM7EBYKDgoHBAADAwIC
ARIDOxcbCg4KBwQAAwMCAgMSAzseHwpECgYEAAMDAgMSAz4QOBo1IFNob3Vs
ZCBleGNsdWRlIG1hbnVhbCBibGFja2xpc3QgKCJBdXRoIiBieSBkZWZhdWx0
KQoKDwoHBAADAwIDBBIEPhA7IAoOCgcEAAMDAgMGEgM+ECMKDgoHBAADAwID
ARIDPiQzCg4KBwQAAwMCAwMSAz42NwoNCgYEAAMDAgQSAz8QOQoPCgcEAAMD
AgQEEgQ/ED44Cg4KBwQAAwMCBAYSAz8QIwoOCgcEAAMDAgQBEgM/JDQKDgoH
BAADAwIEAxIDPzc4Cg0KBgQAAwMCBRIDQRAnCg8KBwQAAwMCBQQSBEEQPzkK
DgoHBAADAwIFBRIDQRAWCg4KBwQAAwMCBQESA0EXIgoOCgcEAAMDAgUDEgNB
JSYKHQoGBAADAwIGEgNDECAiDiBUTFMgd2FzIHVzZWQKCg8KBwQAAwMCBgQS
BEMQQScKDgoHBAADAwIGBRIDQxAUCg4KBwQAAwMCBgESA0MVGwoOCgcEAAMD
AgYDEgNDHh8KRwoGBAADAwIHEgNEECQiOCBieSBjb252ZW50aW9uICJIVFRQ
LzEuMCIsICJIVFRQLzEuMSIsICJIVFRQLzIiIG9yICJoMiIKCg8KBwQAAwMC
BwQSBEQQQyAKDgoHBAADAwIHBRIDRBAWCg4KBwQAAwMCBwESA0QXHwoOCgcE
AAMDAgcDEgNEIiMKDAoEBAADBBIERwhKCQoMCgUEAAMEARIDRxAYCg0KBgQA
AwQCABIDSBAgCg8KBwQAAwQCAAQSBEgQRxoKDgoHBAADBAIABRIDSBAWCg4K
BwQAAwQCAAESA0gXGwoOCgcEAAMEAgADEgNIHh8KDQoGBAADBAIBEgNJECIK
DwoHBAADBAIBBBIESRBIIAoOCgcEAAMEAgEFEgNJEBYKDgoHBAADBAIBARID
SRcdCg4KBwQAAwQCAQMSA0kgIQrXAgoEBAADBRIEUQhxCRrIAiBXZSBzdG9y
ZSBpbmZvcm1hdGlvbiBvbiBlYWNoIHJlc29sdmVyIGV4ZWN1dGlvbiBhcyBh
IE5vZGUgb24gYSB0cmVlLgogVGhlIHN0cnVjdHVyZSBvZiB0aGUgdHJlZSBj
b3JyZXNwb25kcyB0byB0aGUgc3RydWN0dXJlIG9mIHRoZSBHcmFwaFFMCiBy
ZXNwb25zZTsgaXQgZG9lcyBub3QgaW5kaWNhdGUgdGhlIG9yZGVyIGluIHdo
aWNoIHJlc29sdmVycyB3ZXJlCiBpbnZva2VkLiAgTm90ZSB0aGF0IG5vZGVz
IHJlcHJlc2VudGluZyBpbmRleGVzIChhbmQgdGhlIHJvb3Qgbm9kZSkKIGRv
bid0IGNvbnRhaW4gYWxsIE5vZGUgZmllbGRzIChlZyB0eXBlcyBhbmQgdGlt
ZXMpLgoKDAoFBAADBQESA1EQFArUAwoGBAADBQgAEgRZEFwRGsMDIFRoZSBu
YW1lIG9mIHRoZSBmaWVsZCAoZm9yIE5vZGVzIHJlcHJlc2VudGluZyBhIHJl
c29sdmVyIGNhbGwpIG9yIHRoZQogaW5kZXggaW4gYSBsaXN0IChmb3IgaW50
ZXJtZWRpYXRlIE5vZGVzIHJlcHJlc2VudGluZyBlbGVtZW50cyBvZiBhIGxp
c3QpLgogZmllbGRfbmFtZSBpcyB0aGUgbmFtZSBvZiB0aGUgZmllbGQgYXMg
aXQgYXBwZWFycyBpbiB0aGUgR3JhcGhRTAogcmVzcG9uc2U6IGllLCBpdCBt
YXkgYmUgYW4gYWxpYXMuICAoSW4gdGhhdCBjYXNlLCB0aGUgb3JpZ2luYWxf
ZmllbGRfbmFtZQogZmllbGQgaG9sZHMgdGhlIGFjdHVhbCBmaWVsZCBuYW1l
IGZyb20gdGhlIHNjaGVtYS4pIEluIGFueSBjb250ZXh0IHdoZXJlCiB3ZSdy
ZSBidWlsZGluZyB1cCBhIHBhdGgsIHdlIHVzZSB0aGUgcmVzcG9uc2VfbmFt
ZSByYXRoZXIgdGhhbiB0aGUKIG9yaWdpbmFsX2ZpZWxkX25hbWUuCgoOCgcE
AAMFCAABEgNZFhgKDQoGBAADBQIAEgNaGDEKDgoHBAADBQIABRIDWhgeCg4K
BwQAAwUCAAESA1ofLAoOCgcEAAMFAgADEgNaLzAKDQoGBAADBQIBEgNbGCkK
DgoHBAADBQIBBRIDWxgeCg4KBwQAAwUCAQESA1sfJAoOCgcEAAMFAgEDEgNb
JygKDQoGBAADBQICEgNeEDAKDwoHBAADBQICBBIEXhBcEQoOCgcEAAMFAgIF
EgNeEBYKDgoHBAADBQICARIDXhcqCg4KBwQAAwUCAgMSA14tLwpPCgYEAAMF
AgMSA2EQIBpAIFRoZSBmaWVsZCdzIHJldHVybiB0eXBlOyBlLmcuICJTdHJp
bmchIiBmb3IgVXNlci5lbWFpbDpTdHJpbmchCgoPCgcEAAMFAgMEEgRhEF4w
Cg4KBwQAAwUCAwUSA2EQFgoOCgcEAAMFAgMBEgNhFxsKDgoHBAADBQIDAxID
YR4fCkwKBgQAAwUCBBIDZBAoGj0gVGhlIGZpZWxkJ3MgcGFyZW50IHR5cGU7
IGUuZy4gIlVzZXIiIGZvciBVc2VyLmVtYWlsOlN0cmluZyEKCg8KBwQAAwUC
BAQSBGQQYSAKDgoHBAADBQIEBRIDZBAWCg4KBwQAAwUCBAESA2QXIgoOCgcE
AAMFAgQDEgNkJScKDQoGBAADBQIFEgNmEC0KDwoHBAADBQIFBBIEZhBkKAoO
CgcEAAMFAgUGEgNmEBsKDgoHBAADBQIFARIDZhwoCg4KBwQAAwUCBQMSA2Yr
LAo6CgYEAAMFAgYSA2kQJhorIHJlbGF0aXZlIHRvIHRoZSB0cmFjZSdzIHN0
YXJ0X3RpbWUsIGluIG5zCgoPCgcEAAMFAgYEEgRpEGYtCg4KBwQAAwUCBgUS
A2kQFgoOCgcEAAMFAgYBEgNpFyEKDgoHBAADBQIGAxIDaSQlCjoKBgQAAwUC
BxIDaxAkGisgcmVsYXRpdmUgdG8gdGhlIHRyYWNlJ3Mgc3RhcnRfdGltZSwg
aW4gbnMKCg8KBwQAAwUCBwQSBGsQaSYKDgoHBAADBQIHBRIDaxAWCg4KBwQA
AwUCBwESA2sXHwoOCgcEAAMFAgcDEgNrIiMKDQoGBAADBQIIEgNtECoKDgoH
BAADBQIIBBIDbRAYCg4KBwQAAwUCCAYSA20ZHgoOCgcEAAMFAggBEgNtHyQK
DgoHBAADBQIIAxIDbScpCg0KBgQAAwUCCRIDbhApCg4KBwQAAwUCCQQSA24Q
GAoOCgcEAAMFAgkGEgNuGR0KDgoHBAADBQIJARIDbh4jCg4KBwQAAwUCCQMS
A24mKAoMCgUEAAMFCRIDcBkbCg0KBgQAAwUJABIDcBkaCg4KBwQAAwUJAAES
A3AZGgoOCgcEAAMFCQACEgNwGRoK/gIKBAQAAwYSBXcIqQEJGu4CIHJlcHJl
c2VudHMgYSBub2RlIGluIHRoZSBxdWVyeSBwbGFuLCB1bmRlciB3aGljaCB0
aGVyZSBpcyBhIHRyYWNlIHRyZWUgZm9yIHRoYXQgc2VydmljZSBmZXRjaC4K
IEluIHBhcnRpY3VsYXIsIGVhY2ggZmV0Y2ggbm9kZSByZXByZXNlbnRzIGEg
Y2FsbCB0byBhbiBpbXBsZW1lbnRpbmcgc2VydmljZSwgYW5kIGNhbGxzIHRv
IGltcGxlbWVudGluZwogc2VydmljZXMgbWF5IG5vdCBiZSB1bmlxdWUuIFNl
ZSBodHRwczovL2dpdGh1Yi5jb20vYXBvbGxvZ3JhcGhxbC9hcG9sbG8tc2Vy
dmVyL2Jsb2IvbWFpbi9wYWNrYWdlcy9hcG9sbG8tZ2F0ZXdheS9zcmMvUXVl
cnlQbGFuLnRzCiBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhbmQgZGV0YWlscy4K
CgwKBQQAAwYBEgN3EB0KZAoGBAADBgMAEgR5EHsRGlQgVGhpcyByZXByZXNl
bnRzIGEgc2V0IG9mIG5vZGVzIHRvIGJlIGV4ZWN1dGVkIHNlcXVlbnRpYWxs
eSBieSB0aGUgR2F0ZXdheSBleGVjdXRvcgoKDgoHBAADBgMAARIDeRgkCg8K
CAQAAwYDAAIAEgN6GDkKEAoJBAADBgMAAgAEEgN6GCAKEAoJBAADBgMAAgAG
EgN6IS4KEAoJBAADBgMAAgABEgN6LzQKEAoJBAADBgMAAgADEgN6NzgKYwoG
BAADBgMBEgR9EH8RGlMgVGhpcyByZXByZXNlbnRzIGEgc2V0IG9mIG5vZGVz
IHRvIGJlIGV4ZWN1dGVkIGluIHBhcmFsbGVsIGJ5IHRoZSBHYXRld2F5IGV4
ZWN1dG9yCgoOCgcEAAMGAwEBEgN9GCQKDwoIBAADBgMBAgASA34YOQoQCgkE
AAMGAwECAAQSA34YIAoQCgkEAAMGAwECAAYSA34hLgoQCgkEAAMGAwECAAES
A34vNAoQCgkEAAMGAwECAAMSA343OApaCgYEAAMGAwISBoEBEJUBERpIIFRo
aXMgcmVwcmVzZW50cyBhIG5vZGUgdG8gc2VuZCBhbiBvcGVyYXRpb24gdG8g
YW4gaW1wbGVtZW50aW5nIHNlcnZpY2UKCg8KBwQAAwYDAgESBIEBGCEKigIK
CAQAAwYDAgIAEgSFARgwGvcBIFhYWCBXaGVuIHdlIHdhbnQgdG8gaW5jbHVk
ZSBtb3JlIGRldGFpbHMgYWJvdXQgdGhlIHN1Yi1vcGVyYXRpb24gdGhhdCB3
YXMKIGV4ZWN1dGVkIGFnYWluc3QgdGhpcyBzZXJ2aWNlLCB3ZSBzaG91bGQg
aW5jbHVkZSB0aGF0IGhlcmUgaW4gZWFjaCBmZXRjaCBub2RlLgogVGhpcyBt
aWdodCBpbmNsdWRlIGFuIG9wZXJhdGlvbiBzaWduYXR1cmUsIHJlcXVpcmVz
IGRpcmVjdGl2ZSwgcmVmZXJlbmNlIHJlc29sdXRpb25zLCBldGMuCgoTCgkE
AAMGAwICAAQSBoUBGIEBIwoRCgkEAAMGAwICAAUSBIUBGB4KEQoJBAADBgMC
AgABEgSFAR8rChEKCQQAAwYDAgIAAxIEhQEuLwoQCggEAAMGAwICARIEhwEY
NgoTCgkEAAMGAwICAQQSBocBGIUBMAoRCgkEAAMGAwICAQUSBIcBGBwKEQoJ
BAADBgMCAgEBEgSHAR0xChEKCQQAAwYDAgIBAxIEhwE0NQrMAQoIBAADBgMC
AgISBIwBGCgauQEgVGhpcyBUcmFjZSBvbmx5IGNvbnRhaW5zIHN0YXJ0X3Rp
bWUsIGVuZF90aW1lLCBkdXJhdGlvbl9ucywgYW5kIHJvb3Q7CiBhbGwgdGlt
aW5ncyB3ZXJlIGNhbGN1bGF0ZWQgKipvbiB0aGUgZmVkZXJhdGVkIHNlcnZp
Y2UqKiwgYW5kIGNsb2NrIHNrZXcKIHdpbGwgYmUgaGFuZGxlZCBieSB0aGUg
aW5ncmVzcyBzZXJ2ZXIuCgoTCgkEAAMGAwICAgQSBowBGIcBNgoRCgkEAAMG
AwICAgYSBIwBGB0KEQoJBAADBgMCAgIBEgSMAR4jChEKCQQAAwYDAgICAxIE
jAEmJwpdCggEAAMGAwICAxIEjwEYNBpLIHJlbGF0aXZlIHRvIHRoZSBvdXRl
ciB0cmFjZSdzIHN0YXJ0X3RpbWUsIGluIG5zLCBtZWFzdXJlZCBpbiB0aGUg
Z2F0ZXdheS4KChMKCQQAAwYDAgIDBBIGjwEYjAEoChEKCQQAAwYDAgIDBRIE
jwEYHgoRCgkEAAMGAwICAwESBI8BHy8KEQoJBAADBgMCAgMDEgSPATIzCmsK
CAQAAwYDAgIEEgSTARhAGlkgV2FsbGNsb2NrIHRpbWVzIG1lYXN1cmVkIGlu
IHRoZSBnYXRld2F5IGZvciB3aGVuIHRoaXMgb3BlcmF0aW9uIHdhcwogc2Vu
dCBhbmQgcmVjZWl2ZWQuCgoTCgkEAAMGAwICBAQSBpMBGI8BNAoRCgkEAAMG
AwICBAYSBJMBGDEKEQoJBAADBgMCAgQBEgSTATI7ChEKCQQAAwYDAgIEAxIE
kwE+PwoQCggEAAMGAwICBRIElAEYRAoTCgkEAAMGAwICBQQSBpQBGJMBQAoR
CgkEAAMGAwICBQYSBJQBGDEKEQoJBAADBgMCAgUBEgSUATI/ChEKCQQAAwYD
AgIFAxIElAFCQwrJAQoGBAADBgMDEgaZARCcAREatgEgVGhpcyBub2RlIHJl
cHJlc2VudHMgYSB3YXkgdG8gcmVhY2ggaW50byB0aGUgcmVzcG9uc2UgcGF0
aCBhbmQgYXR0YWNoIHJlbGF0ZWQgZW50aXRpZXMuCiBYWFggRmxhdHRlbiBp
cyByZWFsbHkgbm90IHRoZSByaWdodCBuYW1lIGFuZCB0aGlzIG5vZGUgbWF5
IGJlIHJlbmFtZWQgaW4gdGhlIHF1ZXJ5IHBsYW5uZXIuCgoPCgcEAAMGAwMB
EgSZARgjChAKCAQAAwYDAwIAEgSaARhHChEKCQQAAwYDAwIABBIEmgEYIAoR
CgkEAAMGAwMCAAYSBJoBITQKEQoJBAADBgMDAgABEgSaATVCChEKCQQAAwYD
AwIAAxIEmgFFRgoQCggEAAMGAwMCARIEmwEYLwoTCgkEAAMGAwMCAQQSBpsB
GJoBRwoRCgkEAAMGAwMCAQYSBJsBGCUKEQoJBAADBgMDAgEBEgSbASYqChEK
CQQAAwYDAwIBAxIEmwEtLgoQCgYEAAMGAwQSBp0BEKIBEQoPCgcEAAMGAwQB
EgSdARgrChIKCAQAAwYDBAgAEgaeARihARkKEQoJBAADBgMECAABEgSeAR4g
ChAKCAQAAwYDBAIAEgSfASA2ChEKCQQAAwYDBAIABRIEnwEgJgoRCgkEAAMG
AwQCAAESBJ8BJzEKEQoJBAADBgMEAgADEgSfATQ1ChAKCAQAAwYDBAIBEgSg
ASAxChEKCQQAAwYDBAIBBRIEoAEgJgoRCgkEAAMGAwQCAQESBKABJywKEQoJ
BAADBgMEAgEDEgSgAS8wChAKBgQAAwYIABIGowEQqAERCg8KBwQAAwYIAAES
BKMBFhoKDgoGBAADBgIAEgSkARgyCg8KBwQAAwYCAAYSBKQBGCQKDwoHBAAD
BgIAARIEpAElLQoPCgcEAAMGAgADEgSkATAxCg4KBgQAAwYCARIEpQEYMgoP
CgcEAAMGAgEGEgSlARgkCg8KBwQAAwYCAQESBKUBJS0KDwoHBAADBgIBAxIE
pQEwMQoOCgYEAAMGAgISBKYBGCwKDwoHBAADBgICBhIEpgEYIQoPCgcEAAMG
AgIBEgSmASInCg8KBwQAAwYCAgMSBKYBKisKDgoGBAADBgIDEgSnARgwCg8K
BwQAAwYCAwYSBKcBGCMKDwoHBAADBgIDARIEpwEkKwoPCgcEAAMGAgMDEgSn
AS4vCkAKBAQAAgASBKwBCDEaJiBXYWxsY2xvY2sgdGltZSB3aGVuIHRoZSB0
cmFjZSBiZWdhbi4KIgogcmVxdWlyZWQKCg8KBQQAAgAEEgasAQipAQkKDQoF
BAACAAYSBKwBCCEKDQoFBAACAAESBKwBIiwKDQoFBAACAAMSBKwBLzAKQAoE
BAACARIErgEILxomIFdhbGxjbG9jayB0aW1lIHdoZW4gdGhlIHRyYWNlIGVu
ZGVkLgoiCiByZXF1aXJlZAoKDwoFBAACAQQSBq4BCKwBMQoNCgUEAAIBBhIE
rgEIIQoNCgUEAAIBARIErgEiKgoNCgUEAAIBAxIErgEtLgqdAQoEBAACAhIE
sQEIIBqCASBIaWdoIHByZWNpc2lvbiBkdXJhdGlvbiBvZiB0aGUgdHJhY2U7
IG1heSBub3QgZXF1YWwgZW5kX3RpbWUtc3RhcnRfdGltZQogKGVnLCBpZiB5
b3VyIG1hY2hpbmUncyBjbG9jayBjaGFuZ2VkIGR1cmluZyB0aGUgdHJhY2Up
LgoiCiByZXF1aXJlZAoKDwoFBAACAgQSBrEBCK4BLwoNCgUEAAICBRIEsQEI
DgoNCgUEAAICARIEsQEPGgoNCgUEAAICAxIEsQEdHwpyCgQEAAIDEgS0AQgX
GmQgQSB0cmVlIGNvbnRhaW5pbmcgaW5mb3JtYXRpb24gYWJvdXQgYWxsIHJl
c29sdmVycyBydW4gZGlyZWN0bHkgYnkgdGhpcwogc2VydmljZSwgaW5jbHVk
aW5nIGVycm9ycy4KCg8KBQQAAgMEEga0AQixASAKDQoFBAACAwYSBLQBCAwK
DQoFBAACAwESBLQBDREKDQoFBAACAwMSBLQBFBYK/wYKBAQAAgQSBMQBCB4a
qAUgSW4gYWRkaXRpb24gdG8gZGV0YWlscy5yYXdfcXVlcnksIHdlIGluY2x1
ZGUgYSAic2lnbmF0dXJlIiBvZiB0aGUgcXVlcnksCiB3aGljaCBjYW4gYmUg
bm9ybWFsaXplZDogZm9yIGV4YW1wbGUsIHlvdSBtYXkgd2FudCB0byBkaXNj
YXJkIGFsaWFzZXMsIGRyb3AKIHVudXNlZCBvcGVyYXRpb25zIGFuZCBmcmFn
bWVudHMsIHNvcnQgZmllbGRzLCBldGMuIFRoZSBtb3N0IGltcG9ydGFudCB0
aGluZwogaGVyZSBpcyB0aGF0IHRoZSBzaWduYXR1cmUgbWF0Y2ggdGhlIHNp
Z25hdHVyZSBpbiBTdGF0c1JlcG9ydHMuIEluCiBTdGF0c1JlcG9ydHMgc2ln
bmF0dXJlcyBzaG93IHVwIGFzIHRoZSBrZXkgaW4gdGhlIHBlcl9xdWVyeSBt
YXAgKHdpdGggdGhlCiBvcGVyYXRpb24gbmFtZSBwcmVwZW5kZWQpLiAgVGhl
IHNpZ25hdHVyZSBzaG91bGQgYmUgYSB2YWxpZCBHcmFwaFFMIHF1ZXJ5Lgog
QWxsIHRyYWNlcyBtdXN0IGhhdmUgYSBzaWduYXR1cmU7IGlmIHRoaXMgVHJh
Y2UgaXMgaW4gYSBGdWxsVHJhY2VzUmVwb3J0CiB0aGF0IHNpZ25hdHVyZSBp
cyBpbiB0aGUga2V5IG9mIHRyYWNlc19wZXJfcXVlcnkgcmF0aGVyIHRoYW4g
aW4gdGhpcyBmaWVsZC4KIEVuZ2luZXByb3h5IHByb3ZpZGVzIHRoZSBzaWdu
YXR1cmUgaW4gbGVnYWN5X3NpZ25hdHVyZV9uZWVkc19yZXNpZ25pbmcKIGlu
c3RlYWQuCjLFASAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBGaWVs
ZHMgYmVsb3cgdGhpcyBsaW5lIGFyZSAqbm90KiBpbmNsdWRlZCBpbiBmZWRl
cmF0ZWQgdHJhY2VzICh0aGUgdHJhY2VzCiBzZW50IGZyb20gZmVkZXJhdGVk
IHNlcnZpY2VzIHRvIHRoZSBnYXRld2F5KS4KCg8KBQQAAgQEEgbEAQi0ARcK
DQoFBAACBAUSBMQBCA4KDQoFBAACBAESBMQBDxgKDQoFBAACBAMSBMQBGx0K
DAoEBAACBRIExgEIHAoPCgUEAAIFBBIGxgEIxAEeCg0KBQQAAgUGEgTGAQgP
Cg0KBQQAAgUBEgTGARAXCg0KBQQAAgUDEgTGARobCqkBCgQEAAIGEgTKAQgf
GpoBIE5vdGU6IGVuZ2luZXByb3h5IGFsd2F5cyBzZXRzIGNsaWVudF9uYW1l
LCBjbGllbnRfdmVyc2lvbiwgYW5kIGNsaWVudF9hZGRyZXNzIHRvICJub25l
Ii4KIGFwb2xsby1lbmdpbmUtcmVwb3J0aW5nIGFsbG93cyBmb3IgdGhlbSB0
byBiZSBzZXQgYnkgdGhlIHVzZXIuCgoPCgUEAAIGBBIGygEIxgEcCg0KBQQA
AgYFEgTKAQgOCg0KBQQAAgYBEgTKAQ8aCg0KBQQAAgYDEgTKAR0eCgwKBAQA
AgcSBMsBCCIKDwoFBAACBwQSBssBCMoBHwoNCgUEAAIHBRIEywEIDgoNCgUE
AAIHARIEywEPHQoNCgUEAAIHAxIEywEgIQoMCgQEAAIIEgTMAQgiCg8KBQQA
AggEEgbMAQjLASIKDQoFBAACCAUSBMwBCA4KDQoFBAACCAESBMwBDx0KDQoF
BAACCAMSBMwBICEKDAoEBAACCRIEzQEIKAoPCgUEAAIJBBIGzQEIzAEiCg0K
BQQAAgkFEgTNAQgOCg0KBQQAAgkBEgTNAQ8iCg0KBQQAAgkDEgTNASUnCgwK
BAQAAgoSBM8BCBcKDwoFBAACCgQSBs8BCM0BKAoNCgUEAAIKBhIEzwEIDAoN
CgUEAAIKARIEzwENEQoNCgUEAAIKAxIEzwEUFgoMCgQEAAILEgTRAQgmCg8K
BQQAAgsEEgbRAQjPARcKDQoFBAACCwYSBNEBCBMKDQoFBAACCwESBNEBFCAK
DQoFBAACCwMSBNEBIyUKkwIKBAQAAgwSBNcBCCYahAIgSWYgdGhpcyBUcmFj
ZSB3YXMgY3JlYXRlZCBieSBhIGdhdGV3YXksIHRoaXMgaXMgdGhlIHF1ZXJ5
IHBsYW4sIGluY2x1ZGluZwogc3ViLVRyYWNlcyBmb3IgZmVkZXJhdGVkIHNl
cnZpY2VzLiBOb3RlIHRoYXQgdGhlICdyb290JyB0cmVlIG9uIHRoZQogdG9w
LWxldmVsIFRyYWNlIHdvbid0IGNvbnRhaW4gYW55IHJlc29sdmVycyAodGhv
dWdoIGl0IGNvdWxkIGNvbnRhaW4gZXJyb3JzCiB0aGF0IG9jY3VycmVkIGlu
IHRoZSBnYXRld2F5IGl0c2VsZikuCgoPCgUEAAIMBBIG1wEI0QEmCg0KBQQA
AgwGEgTXAQgVCg0KBQQAAgwBEgTXARYgCg0KBQQAAgwDEgTXASMlCoEBCgQE
AAINEgTbAQgnGnMgV2FzIHRoaXMgcmVzcG9uc2Ugc2VydmVkIGZyb20gYSBm
dWxsIHF1ZXJ5IHJlc3BvbnNlIGNhY2hlPyAgKEluIHRoYXQgY2FzZQogdGhl
IG5vZGUgdHJlZSB3aWxsIGhhdmUgbm8gcmVzb2x2ZXJzLikKCg8KBQQAAg0E
EgbbAQjXASYKDQoFBAACDQUSBNsBCAwKDQoFBAACDQESBNsBDSEKDQoFBAAC
DQMSBNsBJCYKUAoEBAACDhIE3gEIJhpCIFdhcyB0aGlzIHF1ZXJ5IHNwZWNp
ZmllZCBzdWNjZXNzZnVsbHkgYXMgYSBwZXJzaXN0ZWQgcXVlcnkgaGFzaD8K
Cg8KBQQAAg4EEgbeAQjbAScKDQoFBAACDgUSBN4BCAwKDQoFBAACDgESBN4B
DSAKDQoFBAACDgMSBN4BIyUKuQEKBAQAAg8SBOIBCCsaqgEgRGlkIHRoaXMg
cXVlcnkgY29udGFpbiBib3RoIGEgZnVsbCBxdWVyeSBzdHJpbmcgYW5kIGEg
cGVyc2lzdGVkIHF1ZXJ5IGhhc2g/CiAoVGhpcyB0eXBpY2FsbHkgbWVhbnMg
dGhhdCBhIHByZXZpb3VzIHJlcXVlc3Qgd2FzIHJlamVjdGVkIGFzIGFuIHVu
a25vd24KIHBlcnNpc3RlZCBxdWVyeS4pCgoPCgUEAAIPBBIG4gEI3gEmCg0K
BQQAAg8FEgTiAQgMCg0KBQQAAg8BEgTiAQ0lCg0KBQQAAg8DEgTiASgqCkkK
BAQAAhASBOUBCCcaOyBXYXMgdGhpcyBvcGVyYXRpb24gcmVnaXN0ZXJlZCBh
bmQgYSBwYXJ0IG9mIHRoZSBzYWZlbGlzdD8KCg8KBQQAAhAEEgblAQjiASsK
DQoFBAACEAUSBOUBCAwKDQoFBAACEAESBOUBDSEKDQoFBAACEAMSBOUBJCYK
SAoEBAACERIE6AEIJho6IFdhcyB0aGlzIG9wZXJhdGlvbiBmb3JiaWRkZW4g
ZHVlIHRvIGxhY2sgb2Ygc2FmZWxpc3Rpbmc/CgoPCgUEAAIRBBIG6AEI5QEn
Cg0KBQQAAhEFEgToAQgMCg0KBQQAAhEBEgToAQ0gCg0KBQQAAhEDEgToASMl
CrkECgQEAAISEgTzAQg0GqcDIE9sZGVyIGFnZW50cyAoZWcgdGhlIEdvIGVu
Z2luZXByb3h5KSByZWxpZWQgdG8gc29tZSBkZWdyZWUgb24gdGhlIEVuZ2lu
ZQogYmFja2VuZCB0byBydW4gdGhlaXIgb3duIHNlbWktY29tcGF0aWJsZSBp
bXBsZW1lbnRhdGlvbiBvZiBhIHNwZWNpZmljCiB2YXJpYW50IG9mIHF1ZXJ5
IHNpZ25hdHVyZXMuIFRoZSBiYWNrZW5kIGRvZXMgbm90IGRvIHRoaXMgZm9y
IG5ldyBhZ2VudHMgKHdoaWNoCiBzZXQgdGhlIGFib3ZlICdzaWduYXR1cmUn
IGZpZWxkKS4gSXQgdXNlZCB0byBzdGlsbCAicmUtc2lnbiIgc2lnbmF0dXJl
cwogZnJvbSBlbmdpbmVwcm94eSwgYnV0IHdlJ3ZlIG5vdyBzaW1wbGlmaWVk
IHRoZSBiYWNrZW5kIHRvIG5vIGxvbmdlciBkbyB0aGlzLgogRGVwcmVjYXRl
ZCBhbmQgaWdub3JlZCBpbiBGdWxsVHJhY2VzUmVwb3J0cy4KMoABIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiBGaWVsZHMgYmVsb3cgdGhpcyBsaW5lIGFyZSBvbmx5
IHNldCBieSB0aGUgb2xkIEdvIGVuZ2luZXByb3h5LgoKDwoFBAACEgQSBvMB
COgBJgoNCgUEAAISBRIE8wEIDgoNCgUEAAISARIE8wEPLwoNCgUEAAISAxIE
8wEyMwpwCgMEAAkSBPcBER4aYyByZW1vdmVkOiBOb2RlIHBhcnNlID0gMTI7
IE5vZGUgdmFsaWRhdGUgPSAxMzsKICAgICAgICAgIElkMTI4IHNlcnZlcl9p
ZCA9IDE7IElkMTI4IGNsaWVudF9pZCA9IDI7CgoMCgQEAAkAEgT3ARETCg0K
BQQACQABEgT3ARETCg0KBQQACQACEgT3ARETCgwKBAQACQESBPcBFRcKDQoF
BAAJAQESBPcBFRcKDQoFBAAJAQISBPcBFRcKDAoEBAAJAhIE9wEZGgoNCgUE
AAkCARIE9wEZGgoNCgUEAAkCAhIE9wEZGgoMCgQEAAkDEgT3ARwdCg0KBQQA
CQMBEgT3ARwdCg0KBQQACQMCEgT3ARwdCpEFCgIEARIGgQIAlQIBGoIFIFRo
ZSBgc2VydmljZWAgdmFsdWUgZW1iZWRkZWQgd2l0aGluIHRoZSBoZWFkZXIg
a2V5IGlzIG5vdCBndWFyYW50ZWVkIHRvIGNvbnRhaW4gYW4gYWN0dWFsIHNl
cnZpY2UsCiBhbmQsIGluIG1vc3QgY2FzZXMsIHRoZSBzZXJ2aWNlIGluZm9y
bWF0aW9uIGlzIHRydXN0ZWQgdG8gY29tZSBmcm9tIHVwc3RyZWFtIHByb2Nl
c3NpbmcuIElmIHRoZQogc2VydmljZSBfaXNfIHNwZWNpZmllZCBpbiB0aGlz
IGhlYWRlciwgdGhlbiBpdCBpcyBjaGVja2VkIHRvIG1hdGNoIHRoZSBjb250
ZXh0IHRoYXQgaXMgcmVwb3J0aW5nIGl0LgogT3RoZXJ3aXNlLCB0aGUgc2Vy
dmljZSBpbmZvcm1hdGlvbiBpcyBkZWR1Y2VkIGZyb20gdGhlIHRva2VuIGNv
bnRleHQgb2YgdGhlIHJlcG9ydGVyIGFuZCB0aGVuIHNlbnQKIGFsb25nIHZp
YSBvdGhlciBtZWNoYW5pc21zIChpbiBLYWZrYSwgdGhlIGBSZXBvcnRLYWZr
YUtleSkuIFRoZSBvdGhlciBpbmZvcm1hdGlvbiAoaG9zdG5hbWUsCiBhZ2Vu
dF92ZXJzaW9uLCBldGMuKSBpcyBzZW50IGJ5IHRoZSBBcG9sbG8gRW5naW5l
IFJlcG9ydGluZyBhZ2VudCwgYnV0IHdlIGRvIG5vdCBjdXJyZW50bHkgc2F2
ZSB0aGF0CiBpbmZvcm1hdGlvbiB0byBhbnkgb2Ygb3VyIHBlcnNpc3RlbnQg
c3RvcmFnZS4KCgsKAwQBARIEgQIIFAooCgQEAQIAEgSDAggcGhogZWcgImhv
c3QtMDEuZXhhbXBsZS5jb20iCgoPCgUEAQIABBIGgwIIgQIWCg0KBQQBAgAF
EgSDAggOCg0KBQQBAgABEgSDAg8XCg0KBQQBAgADEgSDAhobCjIKBAQBAgES
BIYCCCEaGCBlZyAiZW5naW5lcHJveHkgMC4xLjAiCiIKIHJlcXVpcmVkCgoP
CgUEAQIBBBIGhgIIgwIcCg0KBQQBAgEFEgSGAggOCg0KBQQBAgEBEgSGAg8c
Cg0KBQQBAgEDEgSGAh8gCl0KBAQBAgISBIgCCCMaTyBlZyAicHJvZC00Mjc5
LTIwMTYwODA0VDA2NTQyM1otNS1nM2NmMGFhOCIgKHRha2VuIGZyb20gYGdp
dCBkZXNjcmliZSAtLXRhZ3NgKQoKDwoFBAECAgQSBogCCIYCIQoNCgUEAQIC
BRIEiAIIDgoNCgUEAQICARIEiAIPHgoNCgUEAQICAxIEiAIhIgogCgQEAQID
EgSKAggjGhIgZWcgIm5vZGUgdjQuNi4wIgoKDwoFBAECAwQSBooCCIgCIwoN
CgUEAQIDBRIEigIIDgoNCgUEAQIDARIEigIPHgoNCgUEAQIDAxIEigIhIgpe
CgQEAQIEEgSMAggZGlAgZWcgIkxpbnV4IGJveCA0LjYuNS0xLWVjMiAjMSBT
TVAgTW9uIEF1ZyAxIDAyOjMxOjM4IFBEVCAyMDE2IHg4Nl82NCBHTlUvTGlu
dXgiCgoPCgUEAQIEBBIGjAIIigIjCg0KBQQBAgQFEgSMAggOCg0KBQQBAgQB
EgSMAg8UCg0KBQQBAgQDEgSMAhcYCiQKBAQBAgUSBI4CCB8aFiBlZyAiY3Vy
cmVudCIsICJwcm9kIgoKDwoFBAECBQQSBo4CCIwCGQoNCgUEAQIFBRIEjgII
DgoNCgUEAQIFARIEjgIPGQoNCgUEAQIFAxIEjgIcHgrGAQoEBAECBhIEkgII
KRq3ASBBbiBpZCB0aGF0IGlzIHVzZWQgdG8gcmVwcmVzZW50IHRoZSBzY2hl
bWEgdG8gQXBvbGxvIEdyYXBoIE1hbmFnZXIKIFVzaW5nIHRoaXMgaW4gcGxh
Y2Ugb2Ygd2hhdCB1c2VkIHRvIGJlIHNjaGVtYV9oYXNoLCBzaW5jZSB0aGF0
IGlzIG5vIGxvbmdlcgogYXR0YWNoZWQgdG8gYSBzY2hlbWEgaW4gdGhlIGJh
Y2tlbmQuCgoPCgUEAQIGBBIGkgIIjgIfCg0KBQQBAgYFEgSSAggOCg0KBQQB
AgYBEgSSAg8jCg0KBQQBAgYDEgSSAiYoCioKAwQBCRIElAIREyIdIHJlbW92
ZWQgc3RyaW5nIHNlcnZpY2UgPSAzOwoKDAoEBAEJABIElAIREgoNCgUEAQkA
ARIElAIREgoNCgUEAQkAAhIElAIREgoMCgIEAhIGlwIAmwIBCgsKAwQCARIE
lwIIFgoMCgQEAgIAEgSYAggxCg8KBQQCAgAEEgaYAgiXAhgKDQoFBAICAAYS
BJgCCCMKDQoFBAICAAESBJgCJCwKDQoFBAICAAMSBJgCLzAKDAoEBAICARIE
mQIIIAoPCgUEAgIBBBIGmQIImAIxCg0KBQQCAgEFEgSZAggOCg0KBQQCAgEB
EgSZAg8bCg0KBQQCAgEDEgSZAh4fCgwKBAQCAgISBJoCCC4KDwoFBAICAgQS
BpoCCJkCIAoNCgUEAgICBRIEmgIIDgoNCgUEAgICARIEmgIPKQoNCgUEAgIC
AxIEmgIsLQoMCgIEAxIGnQIAqgIBCgsKAwQDARIEnQIIGQoMCgQEAwIAEgSe
AggpCg0KBQQDAgAEEgSeAggQCg0KBQQDAgAFEgSeAhEWCg0KBQQDAgABEgSe
AhckCg0KBQQDAgADEgSeAicoCgwKBAQDAgESBJ8CCCEKDwoFBAMCAQQSBp8C
CJ4CKQoNCgUEAwIBBRIEnwIIDgoNCgUEAwIBARIEnwIPHAoNCgUEAwIBAxIE
nwIfIAoMCgQEAwICEgSgAggeCg8KBQQDAgIEEgagAgifAiEKDQoFBAMCAgUS
BKACCA4KDQoFBAMCAgESBKACDxkKDQoFBAMCAgMSBKACHB0KDAoEBAMCAxIE
oQIIKAoPCgUEAwIDBBIGoQIIoAIeCg0KBQQDAgMFEgShAggOCg0KBQQDAgMB
EgShAg8jCg0KBQQDAgMDEgShAiYnCgwKBAQDAgQSBKICCCoKDwoFBAMCBAQS
BqICCKECKAoNCgUEAwIEBRIEogIIDgoNCgUEAwIEARIEogIPJQoNCgUEAwIE
AxIEogIoKQoMCgQEAwIFEgSjAggvCg0KBQQDAgUEEgSjAggQCg0KBQQDAgUF
EgSjAhEWCg0KBQQDAgUBEgSjAhcqCg0KBQQDAgUDEgSjAi0uCgwKBAQDAgYS
BKQCCCwKDwoFBAMCBgQSBqQCCKMCLwoNCgUEAwIGBhIEpAIIFgoNCgUEAwIG
ARIEpAIXJwoNCgUEAwIGAxIEpAIqKwoMCgQEAwIHEgSlAgguCg8KBQQDAgcE
EgalAgikAiwKDQoFBAMCBwUSBKUCCA4KDQoFBAMCBwESBKUCDykKDQoFBAMC
BwMSBKUCLC0KDAoEBAMCCBIEpgIIMgoNCgUEAwIIBBIEpgIIEAoNCgUEAwII
BRIEpgIRFgoNCgUEAwIIARIEpgIXLQoNCgUEAwIIAxIEpgIwMQoMCgQEAwIJ
EgSnAgg0Cg0KBQQDAgkEEgSnAggQCg0KBQQDAgkFEgSnAhEWCg0KBQQDAgkB
EgSnAhcuCg0KBQQDAgkDEgSnAjEzCgwKBAQDAgoSBKgCCC8KDwoFBAMCCgQS
BqgCCKcCNAoNCgUEAwIKBRIEqAIIDgoNCgUEAwIKARIEqAIPKQoNCgUEAwIK
AxIEqAIsLgoMCgQEAwILEgSpAgguCg8KBQQDAgsEEgapAgioAi8KDQoFBAMC
CwUSBKkCCA4KDQoFBAMCCwESBKkCDygKDQoFBAMCCwMSBKkCKy0KDAoCBAQS
BqwCALACAQoLCgMEBAESBKwCCBQKDAoEBAQCABIErQIIJwoPCgUEBAIABBIG
rQIIrAIWCg0KBQQEAgAFEgStAggOCg0KBQQEAgABEgStAg8iCg0KBQQEAgAD
EgStAiUmCgwKBAQEAgESBK4CCB8KDwoFBAQCAQQSBq4CCK0CJwoNCgUEBAIB
BRIErgIIDgoNCgUEBAIBARIErgIPGgoNCgUEBAIBAxIErgIdHgoMCgQEBAIC
EgSvAggiCg8KBQQEAgIEEgavAgiuAh8KDQoFBAQCAgUSBK8CCA4KDQoFBAQC
AgESBK8CDx0KDQoFBAQCAgMSBK8CICEKDAoCBAUSBrICALUCAQoLCgMEBQES
BLICCCcKDAoEBAUCABIEswIIMgoPCgUEBQIABBIGswIIsgIpCg0KBQQFAgAG
EgSzAggZCg0KBQQFAgABEgSzAhotCg0KBQQFAgADEgSzAjAxCgwKBAQFAgES
BLQCCCEKDwoFBAUCAQQSBrQCCLMCMgoNCgUEBQIBBhIEtAIIFAoNCgUEBQIB
ARIEtAIVHAoNCgUEBQIBAxIEtAIfIAoMCgIEBhIGtwIAugIBCgsKAwQGARIE
twIIHwoMCgQEBgIAEgS4AgghCg8KBQQGAgAEEga4Agi3AiEKDQoFBAYCAAYS
BLgCCBQKDQoFBAYCAAESBLgCFRwKDQoFBAYCAAMSBLgCHyAKDAoEBAYCARIE
uQIIMAoPCgUEBgIBBBIGuQIIuAIhCg0KBQQGAgEGEgS5AggdCg0KBQQGAgEB
EgS5Ah4rCg0KBQQGAgEDEgS5Ai4vCgwKAgQHEga8AgDDAgEKCwoDBAcBEgS8
AggRCj0KBAQHAgASBL0CCB8iLyByZXF1aXJlZDsgZWcgIlN0cmluZyEiIGZv
ciBVc2VyLmVtYWlsOlN0cmluZyEKCg8KBQQHAgAEEga9Agi8AhMKDQoFBAcC
AAUSBL0CCA4KDQoFBAcCAAESBL0CDxoKDQoFBAcCAAMSBL0CHR4KDAoEBAcC
ARIEvgIIIAoPCgUEBwIBBBIGvgIIvQIfCg0KBQQHAgEFEgS+AggOCg0KBQQH
AgEBEgS+Ag8bCg0KBQQHAgEDEgS+Ah4fCgwKBAQHAgISBL8CCBkKDwoFBAcC
AgQSBr8CCL4CIAoNCgUEBwICBRIEvwIIDgoNCgUEBwICARIEvwIPFAoNCgUE
BwICAxIEvwIXGAoMCgQEBwIDEgTAAgguCg8KBQQHAgMEEgbAAgi/AhkKDQoF
BAcCAwUSBMACCA4KDQoFBAcCAwESBMACDykKDQoFBAcCAwMSBMACLC0KOgoE
BAcCBBIEwQIIKSIsIER1cmF0aW9uIGhpc3RvZ3JhbTsgc2VlIGRvY3MvaGlz
dG9ncmFtcy5tZAoKDQoFBAcCBAQSBMECCBAKDQoFBAcCBAUSBMECERYKDQoF
BAcCBAESBMECFyQKDQoFBAcCBAMSBMECJygKCwoDBAcJEgTCAhEZCgwKBAQH
CQASBMICERIKDQoFBAcJAAESBMICERIKDQoFBAcJAAISBMICERIKDAoEBAcJ
ARIEwgIUFQoNCgUEBwkBARIEwgIUFQoNCgUEBwkBAhIEwgIUFQoMCgQEBwkC
EgTCAhcYCg0KBQQHCQIBEgTCAhcYCg0KBQQHCQICEgTCAhcYCgwKAgQIEgbF
AgDJAgEKCwoDBAgBEgTFAggQCjoKBAQIAgASBMcCCDIaLCBLZXkgaXMgKGVn
KSAiZW1haWwiIGZvciBVc2VyLmVtYWlsOlN0cmluZyEKCg8KBQQIAgAEEgbH
AgjFAhIKDQoFBAgCAAYSBMcCCB4KDQoFBAgCAAESBMcCHy0KDQoFBAgCAAMS
BMcCMDEKCwoDBAgJEgTIAhEWCgwKBAQICQASBMgCERIKDQoFBAgJAAESBMgC
ERIKDQoFBAgJAAISBMgCERIKDAoEBAgJARIEyAIUFQoNCgUECAkBARIEyAIU
FQoNCgUECAkBAhIEyAIUFQoMCgIECRIGywIAzgIBCgsKAwQJARIEywIIDQo7
CgQECQIAEgTMAggYIi0gcmVxdWlyZWQ7IGVnICJlbWFpbCIgZm9yIFVzZXIu
ZW1haWw6U3RyaW5nIQoKDwoFBAkCAAQSBswCCMsCDwoNCgUECQIABRIEzAII
DgoNCgUECQIAARIEzAIPEwoNCgUECQIAAxIEzAIWFwo9CgQECQIBEgTNAggf
Ii8gcmVxdWlyZWQ7IGVnICJTdHJpbmchIiBmb3IgVXNlci5lbWFpbDpTdHJp
bmchCgoPCgUECQIBBBIGzQIIzAIYCg0KBQQJAgEFEgTNAggOCg0KBQQJAgEB
EgTNAg8aCg0KBQQJAgEDEgTNAh0eCgwKAgQKEgbQAgDTAgEKCwoDBAoBEgTQ
AggMCjoKBAQKAgASBNECCBgiLCByZXF1aXJlZDsgZWcgIlVzZXIiIGZvciBV
c2VyLmVtYWlsOlN0cmluZyEKCg8KBQQKAgAEEgbRAgjQAg4KDQoFBAoCAAUS
BNECCA4KDQoFBAoCAAESBNECDxMKDQoFBAoCAAMSBNECFhcKDAoEBAoCARIE
0gIIIQoNCgUECgIBBBIE0gIIEAoNCgUECgIBBhIE0gIRFgoNCgUECgIBARIE
0gIXHAoNCgUECgIBAxIE0gIfIAqPBQoCBAsSBt0CAO8CARqABSBUaGlzIGlz
IHRoZSB0b3AtbGV2ZWwgbWVzc2FnZSB1c2VkIGJ5IHRoZSBuZXcgdHJhY2Vz
IGluZ3Jlc3MuIFRoaXMKIGlzIGRlc2lnbmVkIGZvciB0aGUgYXBvbGxvLWVu
Z2luZS1yZXBvcnRpbmcgVHlwZVNjcmlwdCBhZ2VudCBhbmQgd2lsbAogZXZl
bnR1YWxseSBiZSBkb2N1bWVudGVkIGFzIGEgcHVibGljIGluZ3Jlc3MgQVBJ
LiBUaGlzIG1lc3NhZ2UgY29uc2lzdHMKIHNvbGVseSBvZiB0cmFjZXM7IHRo
ZSBlcXVpdmFsZW50IG9mIHRoZSBTdGF0c1JlcG9ydCBpcyBhdXRvbWF0aWNh
bGx5CiBnZW5lcmF0ZWQgc2VydmVyLXNpZGUgZnJvbSB0aGlzIG1lc3NhZ2Uu
IEFnZW50IHNob3VsZCBlaXRoZXIgc2VuZCBhIHRyYWNlIG9yIGluY2x1ZGUg
aXQgaW4gdGhlIHN0YXRzCiBmb3IgZXZlcnkgcmVxdWVzdCBpbiB0aGlzIHJl
cG9ydC4gR2VuZXJhbGx5LCBidWZmZXJpbmcgdXAgdW50aWwgYSBsYXJnZQog
c2l6ZSBoYXMgYmVlbiByZWFjaGVkIChzYXksIDRNQikgb3IgNS0xMCBzZWNv
bmRzIGhhcyBwYXNzZWQgaXMgYXBwcm9wcmlhdGUuCiBUaGlzIG1lc3NhZ2Ug
dXNlZCB0byBiZSBrbm93IGFzIEZ1bGxUcmFjZXNSZXBvcnQsIGJ1dCBnb3Qg
cmVuYW1lZCBzaW5jZSBpdCBpc24ndCBqdXN0IGZvciB0cmFjZXMgYW55bW9y
ZQoKCwoDBAsBEgTdAggOCgwKBAQLAgASBN4CCCAKDwoFBAsCAAQSBt4CCN0C
EAoNCgUECwIABhIE3gIIFAoNCgUECwIAARIE3gIVGwoNCgUECwIAAxIE3gIe
Hwq2AwoEBAsCARIE6AIIORqnAyBrZXkgaXMgc3RhdHNSZXBvcnRLZXkgKCMg
b3BlcmF0aW9uTmFtZVxuc2lnbmF0dXJlKSBOb3RlIHRoYXQgdGhlIG5lc3Rl
ZAogdHJhY2VzIHdpbGwgKm5vdCogaGF2ZSBhIHNpZ25hdHVyZSBvciBkZXRh
aWxzLm9wZXJhdGlvbk5hbWUgKGJlY2F1c2UgdGhlCiBrZXkgaXMgYWRlcXVh
dGUpLgoKIFdlIGFsc28gYXNzdW1lIHRoYXQgdHJhY2VzIGRvbid0IGhhdmUK
IGxlZ2FjeV9wZXJfcXVlcnlfaW1wbGljaXRfb3BlcmF0aW9uX25hbWUsIGFu
ZCB3ZSBkb24ndCByZXF1aXJlIHRoZW0gdG8gaGF2ZQogZGV0YWlscy5yYXdf
cXVlcnkgKHdoaWNoIHdvdWxkIGNvbnN1bWUgYSBsb3Qgb2Ygc3BhY2UgYW5k
IGhhcyBwcml2YWN5L2RhdGEKIGFjY2VzcyBpc3N1ZXMsIGFuZCBpc24ndCBj
dXJyZW50bHkgZXhwb3NlZCBieSBvdXIgYXBwIGFueXdheSkuCgoPCgUECwIB
BBIG6AII3gIgCg0KBQQLAgEGEgToAggjCg0KBQQLAgEBEgToAiQ0Cg0KBQQL
AgEDEgToAjc4CvgCCgQECwICEgTuAggvGsACIFRoaXMgaXMgdGhlIHRpbWUg
dGhhdCB0aGUgcmVxdWVzdHMgaW4gdGhpcyB0cmFjZSBhcmUgY29uc2lkZXJl
ZCB0byBoYXZlIHRha2VuIHBsYWNlCiBJZiB0aGlzIGZpZWxkIGlzIG5vdCBw
cmVzZW50IHRoZSBtYXggb2YgdGhlIGVuZF90aW1lIG9mIGVhY2ggdHJhY2Ug
d2lsbCBiZSB1c2VkIGluc3RlYWQuCiBJZiB0aGVyZSBhcmUgbm8gdHJhY2Vz
IGFuZCBubyBlbmRfdGltZSBwcmVzZW50IHRoZSByZXBvcnQgd2lsbCBub3Qg
YmUgYWJsZSB0byBiZSBwcm9jZXNzZWQuCiBOb3RlOiBUaGlzIHdpbGwgb3Zl
cnJpZGUgdGhlIGVuZF90aW1lIGZyb20gdHJhY2VzLgoiJyByZXF1aXJlZCBp
ZiBubyB0cmFjZXMgaW4gdGhpcyBtZXNzYWdlCgoPCgUECwICBBIG7gII6AI5
Cg0KBQQLAgIGEgTuAgghCg0KBQQLAgIBEgTuAiIqCg0KBQQLAgIDEgTuAi0u
CgwKAgQMEgbxAgD2AgEKCwoDBAwBEgTxAggbCgwKBAQMAgASBPICCCEKDwoF
BAwCAAQSBvICCPECHQoNCgUEDAIABhIE8gIIFAoNCgUEDAIAARIE8gIVHAoN
CgUEDAIAAxIE8gIfIAoMCgQEDAIBEgTzAggyCg8KBQQMAgEEEgbzAgjyAiEK
DQoFBAwCAQYSBPMCCBkKDQoFBAwCAQESBPMCGi0KDQoFBAwCAQMSBPMCMDEK
IQoEBAwCAhIE9QIIMBoTIEtleSBpcyB0eXBlIG5hbWUuCgoPCgUEDAICBBIG
9QII8wIyCg0KBQQMAgIGEgT1AggdCg0KBQQMAgIBEgT1Ah4rCg0KBQQMAgID
EgT1Ai4vCm8KAgQNEgb5AgD8AgEaYSBBIHNlcXVlbmNlIG9mIHRyYWNlcyBh
bmQgc3RhdHMuIEFuIGluZGl2aWR1YWwgdHJhY2Ugc2hvdWxkIGVpdGhlciBi
ZSBjb3VudGVkIGFzIGEgc3RhdCBvciB0cmFjZQoKCwoDBA0BEgT5AggWCgwK
BAQNAgASBPoCCCEKDQoFBA0CAAQSBPoCCBAKDQoFBA0CAAYSBPoCERYKDQoF
BA0CAAESBPoCFxwKDQoFBA0CAAMSBPoCHyAKDAoEBA0CARIE+wIIPAoNCgUE
DQIBBBIE+wIIEAoNCgUEDQIBBhIE+wIRJAoNCgUEDQIBARIE+wIlNwoNCgUE
DQIBAxIE+wI6O2IGcHJvdG8z
