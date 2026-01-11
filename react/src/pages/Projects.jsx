import React from 'react';
import { motion } from 'framer-motion';
import { projects } from '../data/projects';
import ProjectCard from '../components/ProjectCard';
import './Projects.css';

const FadeInWhenVisible = ({ children, delay = 0, direction = 'up' }) => {
    const variants = {
        hidden: {
            opacity: 0,
            y: direction === 'up' ? 50 : (direction === 'down' ? -50 : 0),
            x: direction === 'left' ? -50 : (direction === 'right' ? 50 : 0)
        },
        visible: {
            opacity: 1,
            y: 0,
            x: 0
        }
    };

    return (
        <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.8, delay, ease: "easeOut" }}
            variants={variants}
        >
            {children}
        </motion.div>
    );
};

const Projects = () => {
    return (
        <div className="projects-page">
            <div className="container projects-container">
                <div className="projects-header">
                    <FadeInWhenVisible direction="left">
                        <h1 className="projects-title">ALL PROJECTS</h1>
                    </FadeInWhenVisible>

                    <FadeInWhenVisible direction="right" delay={0.2}>
                        <p className="projects-subtitle">
                            Showcasing my expertise in Cross Platform Development
                        </p>
                    </FadeInWhenVisible>
                </div>

                <FadeInWhenVisible direction="up" delay={0.4}>
                    <div className="all-projects-grid">
                        {projects.map((project) => (
                            <ProjectCard key={project.id} project={project} />
                        ))}
                    </div>
                </FadeInWhenVisible>
            </div>
        </div>
    );
};

export default Projects;
