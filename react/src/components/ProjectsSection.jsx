import React from 'react';
import { useNavigate } from 'react-router-dom';
import { projects } from '../data/projects';
import ProjectCard from './ProjectCard';
import './ProjectsSection.css';

const ProjectsSection = () => {
    const navigate = useNavigate();
    const displayProjects = projects.slice(0, 4);

    return (
        <section className="projects-section">
            <div className="container">
                <div className="section-header">
                    <h2 className="section-title">A SNAPSHOT OF MY RECENT PROJECTS</h2>
                </div>

                <div className="projects-grid">
                    {displayProjects.map((project) => (
                        <ProjectCard key={project.id} project={project} />
                    ))}
                </div>

                <div className="view-all-container">
                    <button
                        className="btn-primary view-all-btn"
                        onClick={() => navigate('/projects')}
                    >
                        View All
                    </button>
                </div>
            </div>
        </section>
    );
};

export default ProjectsSection;
