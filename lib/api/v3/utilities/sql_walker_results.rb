#-- encoding: UTF-8

#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) 2012-2020 the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.
#++

module API
  module V3
    module Utilities
      class SqlWalkerResults
        def initialize(scope, url_query:, self_path: nil, replace_map: {})
          self.filter_scope = scope.dup
          self.projection_scope = scope.dup.reselect("#{scope.model.table_name}.*")
          self.ctes = {}
          self.self_path = self_path
          self.url_query = url_query
          self.replace_map = replace_map
        end

        attr_accessor :filter_scope,
                      :projection_scope,
                      :sql,
                      :selects,
                      :ctes,
                      :self_path,
                      :url_query,
                      :replace_map

        def page_size
          url_query[:pageSize]
        end

        def offset
          url_query[:offset]
        end
      end
    end
  end
end
