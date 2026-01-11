import React, { useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { projects } from '../data/projects';
import DevelopmentProcess from '../components/DevelopmentProcess';
import TechnologyShowcase from '../components/TechnologyShowcase';
import AutoScrollingGallery from '../components/AutoScrollingGallery';
import './ProjectDetail.css';

const FadeIn = ({ children, delay = 0, direction = 'up' }) => {
    const variants = {
        hidden: {
            opacity: 0,
            y: direction === 'up' ? 30 : 0,
            x: direction === 'left' ? -30 : (direction === 'right' ? 30 : 0)
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
            transition={{ duration: 0.6, delay, ease: "easeOut" }}
            variants={variants}
        >
            {children}
        </motion.div>
    );
};

const ClientDetailsBox = ({ project }) => {
    const [isHovered, setIsHovered] = React.useState(false);

    return (
        <motion.div
            className="client-details-box"
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            animate={{
                scale: isHovered ? 1.02 : 1.0,
                backgroundColor: isHovered ? "white" : "rgba(250, 250, 250, 1)",
                borderColor: isHovered ? "rgba(103, 58, 183, 0.3)" : "rgba(238, 238, 238, 1)"
            }}
            transition={{ duration: 0.3 }}
        >
            <div className="detail-item">
                <span className="detail-label">CLIENT</span>
                <span className="detail-value">{project.client}</span>
            </div>
            <div className="detail-item">
                <span className="detail-label">YEAR</span>
                <span className="detail-value">{project.year}</span>
            </div>
            <div className="detail-item">
                <span className="detail-label">ROLE</span>
                <span className="detail-value">{project.role}</span>
            </div>

            {project.link && (
                <a
                    href={project.link}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="play-store-link"
                >
                    <img src="/images/play.png" alt="Get it on Google Play" height="70" />
                </a>
            )}
        </motion.div>
    );
};

const ProjectDetail = () => {
    const { id } = useParams();
    const navigate = useNavigate();
    const project = projects.find(p => p.id === id);

    useEffect(() => {
        if (!project) {
            navigate('/projects');
        }
        window.scrollTo(0, 0);
    }, [project, navigate]);

    if (!project) return null;

    return (
        <div className="project-detail-page">
            {/* Hero Section */}
            <div
                className="project-hero"
                style={{ backgroundImage: `url(${project.imageUrl})` }}
            >
                <div className="project-hero-overlay">
                    <div className="container project-hero-content">
                        <FadeIn delay={0.1}>
                            <h2 className="project-category">{project.category.toUpperCase()}</h2>
                        </FadeIn>
                        <FadeIn delay={0.3}>
                            <h1 className="project-hero-title">{project.title}</h1>
                        </FadeIn>
                    </div>
                </div>
            </div>

            {/* About Section */}
            <div className="project-about-section">
                <div className="container">
                    <div className="about-layout">
                        <div className="about-content">
                            <FadeIn>
                                <h2 className="section-heading">About the Project</h2>
                            </FadeIn>
                            <FadeIn delay={0.1}>
                                <p className="project-full-desc">{project.description}</p>
                            </FadeIn>

                            <div className="desktop-process-wrapper">
                                <FadeIn delay={0.2}>
                                    <DevelopmentProcess project={project} />
                                </FadeIn>
                            </div>
                        </div>

                        <div className="about-sidebar">
                            <FadeIn direction="left" delay={0.2}>
                                <ClientDetailsBox project={project} />
                            </FadeIn>
                        </div>
                    </div>

                    {/* Mobile Process Wrapper (if needed for layout adjustments, but flex handles it) */}
                </div>
            </div>

            <div className="section-divider"></div>

            {/* Technology Showcase */}
            <div className="project-tech-section">
                <div className="container">
                    <FadeIn>
                        <TechnologyShowcase technologies={project.technologies} />
                    </FadeIn>
                </div>
            </div>

            <div className="section-divider"></div>

            {/* Gallery Section */}
            <div className="project-gallery-section">
                <div className="container">
                    <FadeIn>
                        <h2 className="gallery-title">PROJECT GALLERY</h2>
                        <p className="gallery-subtitle">Explore the visual journey of this project</p>
                    </FadeIn>

                    <FadeIn delay={0.2}>
                        <AutoScrollingGallery photos={project.photos} name={project.title} />
                    </FadeIn>
                </div>
            </div>
        </div>
    );
};

export default ProjectDetail;
