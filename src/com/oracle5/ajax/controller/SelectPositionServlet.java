package com.oracle5.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.Position;

@WebServlet("/selectPosition.do")
public class SelectPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPositionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Position> list = new TaskService().selectPosition();
		
		JSONArray result = new JSONArray();
		JSONObject positionInfo = null;
		
		for(Position p: list) {
			positionInfo = new JSONObject();
			
			positionInfo.put("pid", p.getPid());
			positionInfo.put("pname", URLEncoder.encode(p.getPname(), "UTF-8"));
			
			result.add(positionInfo);
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
