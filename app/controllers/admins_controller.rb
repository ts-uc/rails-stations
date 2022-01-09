# coding: utf-8
class AdminsController < ApplicationController
    def movies
        @movies = Movie.all
    end
end
