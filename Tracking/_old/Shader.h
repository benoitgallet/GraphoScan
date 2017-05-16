#pragma once

#include <GL/glew.h>

#include <GLFW/glfw3.h>

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

// Shaders
class Shader
{
public:
	//Program ID;
	GLuint Program;
	//constructeur
	Shader(const GLchar* vertexSourcePath, const GLchar* fragmentSourcePath);
	void Use();
};