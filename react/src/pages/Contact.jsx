import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Mail, Phone, MapPin } from 'lucide-react';
import './Contact.css';

const FadeIn = ({ children, delay = 0, direction = 'up' }) => {
    const variants = {
        hidden: {
            opacity: 0,
            y: direction === 'up' ? 30 : (direction === 'down' ? -30 : 0),
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

const ContactField = ({ label, hint, maxLines = 1, value, onChange, name }) => (
    <div className="contact-field">
        <label className="field-label">{label}</label>
        <div className="field-input-container">
            {maxLines > 1 ? (
                <textarea
                    className="field-input textarea"
                    placeholder={hint}
                    rows={maxLines}
                    value={value}
                    onChange={onChange}
                    name={name}
                />
            ) : (
                <input
                    type="text"
                    className="field-input"
                    placeholder={hint}
                    value={value}
                    onChange={onChange}
                    name={name}
                />
            )}
        </div>
    </div>
);

const Contact = () => {
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        phone: '',
        message: ''
    });
    const [isSending, setIsSending] = useState(false);
    const [status, setStatus] = useState(null); // 'success' | 'error' | null

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const sendEmail = async (e) => {
        e.preventDefault();
        if (!formData.name || !formData.email || !formData.phone || !formData.message) {
            alert("Please fill all fields");
            return;
        }

        setIsSending(true);
        setStatus(null);

        const serviceId = "service_jz2slai";
        const templateId = "template_d7mrkyh";
        const publicKey = "IUWEyZR3DemDVqo8w";

        const data = {
            service_id: serviceId,
            template_id: templateId,
            user_id: publicKey,
            template_params: {
                name: formData.name,
                email: formData.email,
                phone: formData.phone,
                message: formData.message,
            }
        };

        try {
            const response = await fetch("https://api.emailjs.com/api/v1.0/email/send", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(data),
            });

            if (response.ok) {
                setStatus('success');
                setFormData({ name: '', email: '', phone: '', message: '' });
                alert("✅ Message sent successfully!");
            } else {
                setStatus('error');
                alert("❌ Failed to send message!");
            }
        } catch (error) {
            console.error("Error sending email:", error);
            setStatus('error');
            alert("❌ Failed to send message!");
        } finally {
            setIsSending(false);
        }
    };

    return (
        <div className="contact-page">
            <div className="contact-bg-decor circle-1"></div>
            <div className="contact-bg-decor circle-2"></div>

            <div className="container contact-container">
                <div className="contact-layout">
                    {/* Left Side: Header & Info */}
                    <div className="contact-info-section">
                        <FadeIn delay={0.1}>
                            <h1 className="contact-title">LET'S WORK<br />TOGETHER</h1>
                        </FadeIn>
                        <FadeIn delay={0.2}>
                            <p className="contact-desc">
                                Have a project in mind? I'd love to hear about it. Send me a message and let's discuss how we can bring your ideas to life.
                            </p>
                        </FadeIn>

                        <FadeIn delay={0.3}>
                            <div className="contact-card">
                                <div className="contact-icon-box">
                                    <Mail size={24} color="white" />
                                </div>
                                <div className="contact-details">
                                    <span className="contact-label">Email Me</span>
                                    <span className="contact-value">anadhsuhagiya65@gmail.com</span>
                                </div>
                            </div>
                        </FadeIn>
                    </div>

                    {/* Right Side: Form */}
                    <div className="contact-form-section">
                        <FadeIn delay={0.4} direction="left">
                            <div className="glassy-form">
                                <h2 className="form-title">Send a Message</h2>

                                <form onSubmit={sendEmail}>
                                    <ContactField
                                        label="NAME"
                                        hint="Your Name"
                                        name="name"
                                        value={formData.name}
                                        onChange={handleChange}
                                    />
                                    <ContactField
                                        label="EMAIL"
                                        hint="Your Email Address"
                                        name="email"
                                        value={formData.email}
                                        onChange={handleChange}
                                    />
                                    <ContactField
                                        label="CONTACT NUMBER"
                                        hint="Your Phone Number"
                                        name="phone"
                                        value={formData.phone}
                                        onChange={handleChange}
                                    />
                                    <ContactField
                                        label="MESSAGE"
                                        hint="Tell me about your project"
                                        maxLines={5}
                                        name="message"
                                        value={formData.message}
                                        onChange={handleChange}
                                    />

                                    <button
                                        type="submit"
                                        className="submit-btn"
                                        disabled={isSending}
                                    >
                                        {isSending ? (
                                            <div className="spinner"></div>
                                        ) : (
                                            "Send Message"
                                        )}
                                    </button>
                                </form>
                            </div>
                        </FadeIn>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Contact;
