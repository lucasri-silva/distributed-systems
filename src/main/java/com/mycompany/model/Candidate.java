/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.model;

/**
 *
 * @author lucas
 */
public class Candidate {

    private String name;
    private int votesCount;

    public Candidate() {
    }

    public Candidate(String name, int votesCount) {
        this.name = name;
        this.votesCount = votesCount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getVotesCount() {
        return votesCount;
    }

    public void setVotesCount(int votesCount) {
        this.votesCount = votesCount;
    }

}