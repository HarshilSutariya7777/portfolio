import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { ArrowRight } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import './ProjectCard.css';

const ProjectCard = ({ project }) => {
    const [isHovered, setIsHovered] = useState(false);
    const navigate = useNavigate();

    return (
        <div
            className="project-card-wrapper"
            onClick={() => navigate(`/project/${project.id}`)}
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
        >
            <div className="project-image-container">
                <motion.div
                    className="project-image-inner"
                    animate={{ scale: isHovered ? 1.02 : 1.0 }}
                    transition={{ duration: 0.3, ease: "easeOut" }}
                    style={{ backgroundImage: `url(${project.imageUrl})` }}
                >
                    <div className={`image-overlay ${isHovered ? 'hovered' : ''}`}>
                        {isHovered && (
                            <motion.div
                                className="view-project-btn"
                                initial={{ opacity: 0, scale: 0.9 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{ duration: 0.2 }}
                            >
                                <div className="view-project-glass">
                                    <span>VIEW PROJECT</span>
                                </div>
                            </motion.div>
                        )}
                    </div>
                </motion.div>
            </div>

            <div className="project-info">
                <h3 className="project-title">{project.title.toUpperCase()}</h3>
                <p className="project-description">{project.description}</p>

                <div className="view-details-link">
                    <span>VIEW PROJECT</span>
                    <motion.div
                        animate={{ x: isHovered ? 5 : 0 }}
                        transition={{ duration: 0.3 }}
                    >
                        <ArrowRight size={14} color="black" />
                    </motion.div>
                </div>
            </div>
        </div>
    );
};

export default ProjectCard;
