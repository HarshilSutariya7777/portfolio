import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Smartphone, Server, Code, Palette, Wrench, Brain, X, ChevronLeft, ChevronRight, Image as ImageIcon } from 'lucide-react';
import LogoMarquee from '../components/LogoMarquee';
import './About.css';

const FadeInWhenVisible = ({ children, delay = 0 }) => {
    return (
        <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.8, delay, ease: "easeOut" }}
            variants={{
                visible: { opacity: 1, y: 0 },
                hidden: { opacity: 0, y: 30 }
            }}
        >
            {children}
        </motion.div>
    );
};

const SkillCard = ({ skill }) => {
    const [isHovered, setIsHovered] = useState(false);

    return (
        <motion.div
            className="skill-card"
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            animate={{
                backgroundColor: isHovered ? "rgba(255, 255, 255, 0.1)" : "rgba(255, 255, 255, 0.05)",
                scale: isHovered ? 1.02 : 1
            }}
            transition={{ duration: 0.3 }}
        >
            <div className="skill-icon">
                <skill.icon size={40} color="#00BFA6" />
            </div>
            <h3 className="skill-title">{skill.title}</h3>
            <p className="skill-desc">{skill.skills}</p>
        </motion.div>
    );
};

const CertificateCard = ({ cert }) => {
    const [isHovered, setIsHovered] = useState(false);

    return (
        <motion.a
            href={cert.url}
            target="_blank"
            rel="noopener noreferrer"
            className="cert-card"
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            animate={{ scale: isHovered ? 1.02 : 1 }}
            transition={{ duration: 0.3 }}
        >
            <div className="cert-icon-container" style={{ backgroundColor: cert.color }}>
                <div className="cert-img-wrapper">
                    <img src={cert.image} alt={cert.title} className="cert-img" />
                </div>
            </div>
            <h3 className="cert-title">{cert.title}</h3>
            <p className="cert-subtitle">{cert.subtitle}</p>
        </motion.a>
    );
};

const ExperienceCard = ({ item, onClick }) => {
    return (
        <div className="experience-card" onClick={onClick}>
            <div className="exp-img-container">
                <img src={item.images[0]} alt={item.title} className="exp-img" />
                {item.images.length > 1 && (
                    <div className="exp-count-badge">
                        <ImageIcon size={14} color="white" />
                        <span>{item.images.length}</span>
                    </div>
                )}
            </div>
        </div>
    );
};

const Lightbox = ({ images, initialIndex, onClose }) => {
    const [currentIndex, setCurrentIndex] = useState(initialIndex);

    const nextImage = (e) => {
        e.stopPropagation();
        if (currentIndex < images.length - 1) {
            setCurrentIndex(currentIndex + 1);
        }
    };

    const prevImage = (e) => {
        e.stopPropagation();
        if (currentIndex > 0) {
            setCurrentIndex(currentIndex - 1);
        }
    };

    return (
        <motion.div
            className="lightbox-overlay"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
        >
            <button className="lightbox-close" onClick={onClose}>
                <X size={30} color="white" />
            </button>

            <div className="lightbox-content" onClick={(e) => e.stopPropagation()}>
                <img src={images[currentIndex]} alt="Experience" className="lightbox-img" />
            </div>

            {images.length > 1 && (
                <div className="lightbox-controls">
                    {currentIndex > 0 && (
                        <button className="lightbox-nav prev" onClick={prevImage}>
                            <ChevronLeft size={30} color="white" />
                        </button>
                    )}

                    <div className="lightbox-indicator">
                        {currentIndex + 1} / {images.length}
                    </div>

                    {currentIndex < images.length - 1 && (
                        <button className="lightbox-nav next" onClick={nextImage}>
                            <ChevronRight size={30} color="white" />
                        </button>
                    )}
                </div>
            )}
        </motion.div>
    );
};

const About = () => {
    const [lightboxOpen, setLightboxOpen] = useState(false);
    const [currentImages, setCurrentImages] = useState([]);
    const [initialIndex, setInitialIndex] = useState(0);

    const openLightbox = (images, index) => {
        setCurrentImages(images);
        setInitialIndex(index);
        setLightboxOpen(true);
    };

    const skills = [
        { title: 'Application Development', skills: 'Android, iOS, Web, Desktop, macOS (Flutter)', icon: Smartphone },
        { title: 'Backend & API Integration', skills: 'RESTful APIs, Cloud Storage, Core PHP APIs, Node.js APIs', icon: Server },
        { title: 'Programming Languages', skills: 'Dart, Core PHP, Javascript, VB.NET', icon: Code },
        { title: 'UI/UX Tools', skills: 'Adobe Photoshop, Canva', icon: Palette },
        { title: 'Development Tools', skills: 'Android Studio, Visual Studio Code, Google Antigravity', icon: Wrench },
        { title: 'Core Competencies', skills: 'State Management (GetX), Firebase Integration, Performance Optimization', icon: Brain },
    ];

    const certificates = [
        { title: 'AWS Cloud Computing', subtitle: 'Certification', color: 'white', image: '/images/3d/aws.png', url: 'https://drive.google.com/file/d/13hAEiJl8yvefMgbJ_dj6lvwY6kHUjbMs/view?usp=sharing' },
        { title: 'Database Management System', subtitle: 'Certification', color: 'white', image: '/images/3d/dbms.webp', url: 'https://drive.google.com/file/d/18KKB1CUUseXSUxQxRWYvq521NqRLC6KM/view?usp=sharing' },
        { title: 'MongoDB Basic to Advance', subtitle: 'Certifications', color: 'white', image: '/images/3d/mongo.png', url: 'https://drive.google.com/file/d/1L5uscaeeC_bUeYTb9fA3wiDsQgXlbBUv/view?usp=sharing' },
        { title: 'Java - JDBC, Multithreading and Collection', subtitle: 'Certifications', color: 'white', image: '/images/3d/java.webp', url: 'https://drive.google.com/file/d/12FHvHbqZsmUoQDOB-FFk1K7Bu3S3hUea/view?usp=sharing' },
        { title: 'ASP.NET Core', subtitle: 'Certifications', color: 'white', image: '/images/3d/asp.webp', url: 'https://drive.google.com/file/d/1gda9saUWKFOmcnK0fCT2bfbbJz010hXh/view?usp=sharing' },
        { title: 'Mail Chip', subtitle: 'Certifications', color: 'white', image: '/images/3d/mail.png', url: 'https://drive.google.com/file/d/1rSi18zv0JgZrivjHj5dfa8fWFDGf-RUM/view?usp=sharing' },
        { title: 'Applied Sustainability Engineering', subtitle: 'Certifications', color: 'white', image: '/images/3d/sus.webp', url: 'https://drive.google.com/file/d/1g2HRD5j-bC8EO33Dz1KFBxjIgHIESUVT/view?usp=sharing' },
        { title: 'Career Launchpad', subtitle: 'Certifications', color: 'white', image: '/images/3d/career.webp', url: 'https://drive.google.com/file/d/1V9iHYQ29aNFMGVvG4XR-crHFraBTyV-O/view?usp=sharing' },
        { title: 'Impactful Workplace Communication', subtitle: 'Certifications', color: 'white', image: '/images/3d/communication.webp', url: 'https://drive.google.com/file/d/1usIAihtsICz5qqJM4qgYI_ey3E6qy4fZ/view?usp=sharing' },
        { title: 'Complete Interview Prep', subtitle: 'Certifications', color: 'white', image: '/images/3d/interview.webp', url: 'https://drive.google.com/file/d/17Qio7dfsELCLYpNya1TIPuIea69Glf6c/view?usp=sharing' },
        { title: 'SOP Writing Mastery', subtitle: 'Certifications', color: 'white', image: '/images/3d/sop.webp', url: 'https://drive.google.com/file/d/1CxuLAl6uznXxl8olLNnEmAOynQtH2t2I/view?usp=sharing' },
    ];

    const experienceItems = [
        {
            title: 'Appreciation Letter',
            images: ["/images/letters/1.jpg"]
        },
        {
            title: 'CodzCart Infotech Appreciation Letter',
            images: ["/images/letters/2.jpg", "/images/letters/3.jpg"]
        },
    ];

    return (
        <div className="about-page">
            {/* Intro Section */}
            {/* Intro Section */}
            <section className="about-intro">
                <div className="container about-intro-container">
                    <div className="about-image-side">
                        <img src="/images/anadh.png" alt="Anadh Suhagiya" className="about-profile-img" />
                    </div>

                    <div className="about-text-side">
                        <FadeInWhenVisible>
                            <h1 className="about-title">ABOUT ME</h1>
                            <p className="about-desc">
                                I am Anadh Suhagiya, a passionate Flutter Developer with a knack for building beautiful and functional applications.
                                I specialize in backend development using Core PHP and Node.js, and I have extensive experience with databases like MySQL and MongoDB.
                                I also have a strong foundation in React.js, allowing me to bridge the gap between mobile and web development seamlessly.
                            </p>
                        </FadeInWhenVisible>

                        <div className="intro-footer">
                            <motion.h2
                                className="flutter-bg-text"
                                initial={{ opacity: 0, x: 50 }}
                                whileInView={{ opacity: 1, x: 0 }}
                                transition={{ duration: 1.2 }}
                            >
                                FLUTTER
                            </motion.h2>
                            <h2 className="anadh-name">ANADH SUHAGIYA</h2>
                        </div>
                    </div>
                </div>
            </section>

            <FadeInWhenVisible>
                <LogoMarquee />
            </FadeInWhenVisible>

            {/* Skills Section */}
            <section className="skills-section">
                <div className="container">
                    <FadeInWhenVisible>
                        <h2 className="section-title white">MY SKILLS & EXPERTISE</h2>
                    </FadeInWhenVisible>

                    <div className="skills-grid">
                        {skills.map((skill, index) => (
                            <FadeInWhenVisible key={index} delay={index * 0.1}>
                                <SkillCard skill={skill} />
                            </FadeInWhenVisible>
                        ))}
                    </div>
                </div>
            </section>

            {/* Certifications Section */}
            <section className="cert-section">
                <div className="container">
                    <FadeInWhenVisible>
                        <h2 className="section-title">KEY CERTIFICATES</h2>
                    </FadeInWhenVisible>

                    <div className="cert-grid">
                        {certificates.map((cert, index) => (
                            <FadeInWhenVisible key={index} delay={index * 0.1}>
                                <CertificateCard cert={cert} />
                            </FadeInWhenVisible>
                        ))}
                    </div>
                </div>
            </section>

            <div className="section-divider"></div>

            {/* Experience Section */}
            <section className="exp-section">
                <div className="container">
                    <FadeInWhenVisible>
                        <h2 className="section-title">EXPERIENCE & APPRECIATION</h2>
                    </FadeInWhenVisible>

                    <div className="exp-grid">
                        {experienceItems.map((item, index) => (
                            <FadeInWhenVisible key={index} delay={index * 0.1}>
                                <ExperienceCard
                                    item={item}
                                    onClick={() => openLightbox(item.images, 0)}
                                />
                            </FadeInWhenVisible>
                        ))}
                    </div>

                    {experienceItems.length === 0 && (
                        <p className="coming-soon">Coming Soon...</p>
                    )}
                </div>
            </section>

            <AnimatePresence>
                {lightboxOpen && (
                    <Lightbox
                        images={currentImages}
                        initialIndex={initialIndex}
                        onClose={() => setLightboxOpen(false)}
                    />
                )}
            </AnimatePresence>
        </div>
    );
};

export default About;
